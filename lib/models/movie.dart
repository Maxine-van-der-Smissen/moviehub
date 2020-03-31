import 'package:moviehub/models/cast.dart';
import 'package:moviehub/models/genres.dart';
import 'package:moviehub/models/review.dart';

class MovieCardModel {
  final int movieId;
  final String movieTitle;
  final String movieGenres;
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
  final List<Cast> movieCast;
  final List<Review> movieReviews;
  final String movieReleaseDate;
  final String movieDuration;
  final String movieCoverURL;
  final String movieBackdropURL;
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
      this.movieRatingCount);
}
