import 'dart:async';
import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:moviehub/models/genres.dart';
import 'package:moviehub/models/movie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class NetworkUtils {
  static final String baseUrl = "https://api.themoviedb.org/4/";
  static final String baseImageUrl = "https://image.tmdb.org/t/p/original";

  // Builds a url according to the shared preferences
  static Future<String> urlBuilder(
      String path, SharedPreferences preferences) async {
    List<String> headers = List();
    List<String> filters = preferences.getStringList("filters");
    String sort = preferences.getString("sort");

    await DotEnv().load(".env");

    headers.add("?api_key=" +
        DotEnv().env["apiKey"]); // Add API key to the headers list

    if (filters != null) headers.addAll(filters);
    if (sort != null) headers.add("sort_by=" + sort);

    String header = headers.join("&");

    return baseUrl + path + header;
  }

  // Returns the movies parsed into objects of the Movie class
  static Future<List<MovieCardObject>> fetchMovies(String url) async {
    List<MovieCardObject> movies = new List();

    final response = await http.get(url);

    dynamic body = response.body;

    List<dynamic> movieJson = json.decode(body)['results'];

    if (response.statusCode == 200 && movieJson != null) {
      for (Map<String, dynamic> movie in movieJson) {
        List<String> genreList = List();

        for (int genreId in movie["genre_ids"]) {
          genreList.add(Genres.genres.putIfAbsent(genreId, () => ""));
        }

        movies.add(MovieCardObject(
            movieId: movie["id"],
            movieTitle: movie["title"],
            movieCoverURL: baseImageUrl + movie["poster_path"],
            movieRating: (movie["vote_average"] * 1.0).round() * .5,
            movieReleaseDate: movie["release_date"],
            movieGenres: genreList.join(", ")));
      }

      return movies;
    } else {
      throw Exception('Failed to load post');
    }
  }
}
