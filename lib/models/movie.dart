import 'package:moviehub/models/cast_member.dart';
import 'package:moviehub/models/genres.dart';
import 'package:moviehub/models/review.dart';
import 'package:moviehub/utils/network_utils.dart';
import 'package:share/share.dart';

class MovieCardModel {
  final int movieId;
  final String movieTitle;
  final List<Genre> movieGenres;
  final String movieReleaseDate;
  final String movieCoverURL;
  final double movieRating;

  MovieCardModel(
      {this.movieId,
      this.movieTitle,
      this.movieGenres,
      this.movieReleaseDate,
      this.movieCoverURL,
      this.movieRating});
}

class MovieDetailsModel {
  final int movieId;
  final String movieTitle;
  final String movieDirector;
  final String movieSynopsis;
  final List<Genre> movieGenres;
  final List<CastMember> movieCast;
  final List<Review> movieReviews;
  final String movieReleaseDate;
  final String movieDuration;
  final String movieCoverURL;
  final String movieBackdropURL;
  final String trailerURL;
  final double movieRating;
  final int movieRatingCount;

  MovieDetailsModel(
      this.movieId,
      this.movieTitle,
      this.movieDirector,
      this.movieSynopsis,
      this.movieGenres,
      this.movieCast,
      this.movieReviews,
      this.movieReleaseDate,
      this.movieDuration,
      this.movieCoverURL,
      this.movieBackdropURL,
      this.movieRating,
      this.movieRatingCount,
      this.trailerURL);

  static void shareMovie(MovieDetailsModel movie) async {
    String movieURL = await NetworkUtils.fetchIMDBURL(movie.movieId);

    String trailer = (movie.trailerURL != null) ? "Trailer: ${movie.trailerURL}\n\n" : "";
    String genres = (movie.movieGenres != null) ? "Genres: ${movie.movieGenres.map((movieGenre) => movieGenre.name).toString().replaceAll("(", "").replaceAll(")", "")}" : "";
    String director = (movie.movieDirector != null) ? "Director: ${movie.movieDirector}\n\n" : "";

    String message = ""
        "*${movie.movieTitle}*\n\n"
        "${movie.movieSynopsis}\n\n"
        "$trailer"
        "$genres"
        "$director"
        "Read more about this movie: $movieURL\n\n"
        "*Shared by MovieHub, download the app now!*";
    Share.share(message);
  }
}

class MovieDetailsHeaderModel {
  final String movieTitle;
  final String movieDirector;
  final String movieReleaseDate;
  final String movieDuration;
  final double movieRating;

  MovieDetailsHeaderModel(this.movieTitle, this.movieDirector,
      this.movieReleaseDate, this.movieDuration, this.movieRating);
}
