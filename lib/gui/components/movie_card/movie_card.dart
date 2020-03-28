import 'package:flutter/material.dart';
import 'package:moviehub/models/movie.dart';

import 'movie_card_cover.dart';
import 'movie_card_text_column.dart';

class MovieCard extends StatelessWidget {

  final Movie movie;

  const MovieCard({this.movie}) : super();

  @override
  Widget build(BuildContext context) {
    // TODO: Text Style and refactor code into multiple modules / files
    return Flexible(
      child: GestureDetector(
        onTap: () {
          final snackBar = SnackBar(content: Text("Clicked the Container with movieId: " + movie.movieId.toString()));
          Scaffold.of(context).showSnackBar(snackBar);
          },
        child: Container( // Main Container
          margin: EdgeInsets.only(top: 22),
          height: 170,
          width: MediaQuery.of(context).size.width,
          color: Colors.transparent,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              Container( // White Text container
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      spreadRadius: 0,
                      blurRadius: 10
                    )
                  ],
                  borderRadius: BorderRadius.circular(5),
                  color: Theme.of(context).backgroundColor,
                ),
                height: 150,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container( // Text column container
                    margin: EdgeInsets.only(left: 125, right: 14),
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
                left: 12,
                top: 0,
                bottom: 12,
                child: MovieCardCover(
                  movieCoverURL: movie.movieCoverURL,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

