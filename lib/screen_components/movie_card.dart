import 'package:flutter/material.dart';
import 'package:moviehub/screen_components/movie_card_components/movie_card_cover.dart';
import 'package:moviehub/screen_components/movie_card_components/movie_card_text_column.dart';

class MovieCard extends StatelessWidget {

  final Movie movie;

  const MovieCard({this.movie}) : super();

  @override
  Widget build(BuildContext context) {
    // TODO: Text Style and refactor code into multiple modules / files
    return Flexible(
      child: Container( // Main Container
        margin: EdgeInsets.only(top: 10),
        height: 170,
        width: MediaQuery.of(context).size.width,
        color: Colors.red, // TODO: Make transparent
        child: Stack(
          children: <Widget>[
            Positioned(
              bottom: 0,
              child: Container( // White Text container
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Theme.of(context).backgroundColor,
                ),
                width: MediaQuery.of(context).size.width, // TODO: MediaQuery is too wide
                height: 146,
                child: Container( // Text column container
                  margin: EdgeInsets.only(left: 142),
                  child: MovieCardTextColumn(
                    movieTitle: movie.movieTitle,
                    movieDirector: movie.movieDirector,
                    movieGenres: movie.movieGenres,
                    movieDuration: movie.movieDuration,
                    movieRating: movie.movieRating,
                  ),
                ),
              ),
            ),
            Positioned(
              left: -11,
              top: 0,
              bottom: 12,
              child: MovieCardCover(
                movieCoverURL: movie.movieCoverURL,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Movie {

  final String movieTitle;
  final String movieDirector;
  final String movieGenres;
  final String movieDuration;
  final String movieCoverURL;
  final int movieRating;

  Movie({this.movieTitle, this.movieDirector, this.movieGenres, this.movieDuration, this.movieCoverURL, this.movieRating});
}