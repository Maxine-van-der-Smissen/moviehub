import 'package:moviehub/models/account.dart';
import 'package:moviehub/models/cast_member.dart';
import 'package:moviehub/models/genres.dart';
import 'package:moviehub/models/list.dart';
import 'package:moviehub/models/movie.dart';

import 'data.dart';

class Converter {
  static final String baseTMDBImageUrl = "https://image.tmdb.org/t/p/";
  static final String baseGravatarImageUrl = "https://www.gravatar.com/avatar/";

  static MovieDetailsModel convertMovieDetails(Map<String, dynamic> movieJson,
      Map<String, dynamic> creditsJson, Map<String, dynamic> videoJson) {
    List<Genre> genres = List();
    List<CastMember> cast = List();
    List<dynamic> crewJson = creditsJson["crew"];

    String director = crewJson.firstWhere((crew) => crew["job"] == "Director",
        orElse: () => {"name": ""})["name"];

    int durationMin = movieJson["runtime"] != null ? movieJson["runtime"] : 0;
    String duration = "${(durationMin / 60).floor()}h ${durationMin % 60}m";

    if (movieJson["genres"] != null) {
      for (Map<String, dynamic> genreJson in movieJson["genres"]) {
        genres.add(Genre(genreJson["id"] != null ? genreJson["id"] : -2,
            genreJson["name"] != null ? genreJson["name"] : Data.genres[-2]));
      }
    }

    if (creditsJson["cast"] != null) {
      for (Map<String, dynamic> castJson in creditsJson["cast"]) {
        cast.add(CastMember(
            castJson["name"],
            castJson["profile_path"] != null
                ? "${baseTMDBImageUrl}w185${castJson["profile_path"]}"
                : null));
      }
    }

    String videoUrl;

    if (videoJson != null) {
      Map<String, dynamic> youtubeTrailer =
          (videoJson["results"] as List<dynamic>).firstWhere(
              (video) =>
                  video["type"] == "Trailer" && video["site"] == "YouTube",
              orElse: () => {"key": null});

      videoUrl = youtubeTrailer["key"] != null
          ? "https://www.youtube.com/watch?v=${youtubeTrailer["key"]}"
          : null;
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
        movieJson["poster_path"] != null
            ? "${baseTMDBImageUrl}w342${movieJson["poster_path"]}"
            : null,
        movieJson["backdrop_path"] != null
            ? "${baseTMDBImageUrl}w1280${movieJson["backdrop_path"]}"
            : null,
        movieJson["vote_average"] != null
            ? (movieJson["vote_average"] * 1.0).round() * .5
            : 0,
        movieJson["vote_count"],
        videoUrl);
  }

  static MovieCardModel convertMovieCard(Map<String, dynamic> movie) {
    List<Genre> genreList = List();

    if (movie["genre_ids"] != null) {
      for (int genreId in movie["genre_ids"]) {
        genreList.add(Genre(genreId, Data.genres[genreId]));
      }
    } else
      genreList.add(Genre(-1, Data.genres[-1]));

    return MovieCardModel(
        movieId: movie["id"],
        movieTitle: movie["title"],
        movieCoverURL: movie["poster_path"] != null
            ? "${baseTMDBImageUrl}w342${movie["poster_path"]}"
            : null,
        movieRating: movie["vote_average"] != null
            ? (movie["vote_average"] * 1.0).round() * .5
            : 0,
        movieReleaseDate: movie["release_date"],
        movieGenres: genreList);
  }

  static Account convertAccount(Map<String, dynamic> json) {
    return Account(
        json["id"],
        json["session_id"],
        json["username"],
        json["avatar"] != null &&
                json["avatar"]["gravatar"] != null &&
                json["avatar"]["gravatar"]["hash"] != null
            ? "$baseGravatarImageUrl${json["avatar"]["gravatar"]["hash"]}"
            : null);
  }

  static ListCardModel convertListCard(Map<String, dynamic> json) {
    return ListCardModel(
        json["id"], json["item_count"], json["name"], json["description"]);
  }
}
