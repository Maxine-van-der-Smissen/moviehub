import 'package:moviehub/models/account.dart';
import 'package:moviehub/models/cast_member.dart';
import 'package:moviehub/models/genres.dart';
import 'package:moviehub/models/movie.dart';

import 'data.dart';

class Converter {
  static final String baseTMDBImageUrl = "https://image.tmdb.org/t/p/original";
  static final String baseGravatarImageUrl = "https://www.gravatar.com/avatar/";

  static MovieDetailsModel convertMovieDetails(
      Map<String, dynamic> movieJson, Map<String, dynamic> creditsJson) {
    List<Genre> genres = List();
    List<CastMember> cast = List();
    List<dynamic> crewJson = creditsJson["crew"];

    String director =
        crewJson.firstWhere((crew) => crew["job"] == "Director")["name"];

    int durationMin = movieJson["runtime"];
    String duration = "${(durationMin / 60).floor()}h ${durationMin % 60}m";

    for (Map<String, dynamic> genreJson in movieJson["genres"]) {
      genres.add(Genre(genreJson["id"], genreJson["name"]));
    }

    for (Map<String, dynamic> castJson in creditsJson["cast"]) {
      cast.add(CastMember(
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

  static MovieCardModel convertMovieCard(Map<String, dynamic> movie) {
    List<String> genreList = List();

    for (int genreId in movie["genre_ids"]) {
      genreList.add(Data.genres[genreId]);
    }

    return MovieCardModel(
        movieId: movie["id"],
        movieTitle: movie["title"],
        movieCoverURL: baseTMDBImageUrl + movie["poster_path"],
        movieRating: (movie["vote_average"] * 1.0).round() * .5,
        movieReleaseDate: movie["release_date"],
        movieGenres: genreList.join(", "));
  }

  static Account convertAccount(Map<String, dynamic> json) {
    return Account(json["id"], json["session_id"], json["username"],
        "$baseGravatarImageUrl${json["avatar"]["gravatar"]["hash"]}");
  }
}
