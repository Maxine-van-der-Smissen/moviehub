import 'dart:async';
import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:moviehub/models/cast.dart';
import 'package:moviehub/models/genres.dart';
import 'package:moviehub/models/movie.dart';
import 'package:moviehub/utils/data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class NetworkUtils {
  static final String baseUrl = "https://api.themoviedb.org/4/";
  static final String baseTMDBImageUrl = "https://image.tmdb.org/t/p/original";
  static final String baseGravatarImageUrl = "https://www.gravatar.com/avatar/";

  // Builds a url according to the shared preferences
  static Future<String> urlBuilder(
      String path, SharedPreferences preferences) async {
    List<String> headers = List();

    await DotEnv().load(".env");

    headers.add("?api_key=" +
        DotEnv().env["apiKey"]); // Add API key to the headers list

    if (preferences != null) {
      List<String> filters = preferences.getStringList("filters");
      String sort = preferences.getString("sort");

      if (filters != null) headers.addAll(filters);
      if (sort != null) headers.add("sort_by=" + sort);
    }

    String header = headers.join("&");

    return baseUrl + path + header;
  }

  // Returns the movies parsed into objects of the Movie class
  static Future<List<MovieCardModel>> fetchMovies(String url) async {
    List<MovieCardModel> movies = new List();

    final response = await http.get(url);

    dynamic body = response.body;

    List<dynamic> movieJson = json.decode(body)['results'];

    if (response.statusCode == 200 && movieJson != null) {
      for (Map<String, dynamic> movie in movieJson) {
        List<String> genreList = List();

        for (int genreId in movie["genre_ids"]) {
          genreList.add(Data.genres[genreId]);
        }

        movies.add(MovieCardModel(
            movieId: movie["id"],
            movieTitle: movie["title"],
            movieCoverURL: baseTMDBImageUrl + movie["poster_path"],
            movieRating: (movie["vote_average"] * 1.0).round() * .5,
            movieReleaseDate: movie["release_date"],
            movieGenres: genreList.join(", ")));
      }

      return movies;
    } else {
      throw Exception('Failed to load post');
    }
  }

  static Future<MovieDetailsModel> fetchMovieDetails(int movieId) async {
    await DotEnv().load(".env");
    String apiKey = DotEnv().env["apiKey"];

    final detailsResponse = await http
        .get("https://api.themoviedb.org/3/movie/$movieId?api_key=$apiKey");
    final creditsResponse = await http.get(
        "https://api.themoviedb.org/3/movie/$movieId/credits?api_key=$apiKey");

    Map<String, dynamic> movieJson = json.decode(detailsResponse.body);
    Map<String, dynamic> creditsJson = json.decode(creditsResponse.body);

    if (detailsResponse.statusCode == 200 &&
        creditsResponse.statusCode == 200 &&
        movieJson != null &&
        creditsJson != null) {
      List<Genre> genres = List();
      List<Cast> cast = List();
      List<dynamic> crewJson = creditsJson["crew"];

      String director =
          crewJson.firstWhere((crew) => crew["job"] == "Director")["name"];

      int durationMin = movieJson["runtime"];
      String duration = "${durationMin / 60}h ${durationMin % 60}m";

      for (Map<String, dynamic> genreJson in movieJson["genres"]) {
        genres.add(Genre(genreJson["id"], genreJson["name"]));
      }

      for (Map<String, dynamic> castJson in creditsJson["cast"]) {
        cast.add(Cast(
            castJson["name"], "$baseTMDBImageUrl${castJson["profile_path"]}"));
      }

      return MovieDetailsModel(
          movieJson["id"],
          movieJson["title"],
          director,
          movieJson["overview"],
          genres,
          cast,
          List(),
          movieJson["release_date"],
          duration,
          "$baseTMDBImageUrl${movieJson["poster_path"]}",
          "$baseTMDBImageUrl${movieJson["backdrop_path"]}",
          (movieJson["vote_average"] * 1.0).round() * .5,
          movieJson["vote_count"]);
    }
  }
}
