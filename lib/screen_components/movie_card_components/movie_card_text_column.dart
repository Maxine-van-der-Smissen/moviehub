import 'package:flutter/material.dart';

class MovieCardTextColumn extends StatelessWidget {

  final String movieTitle;
  final String movieDirector;
  final String movieGenres;
  final String movieDuration;
  final int movieRating;

  const MovieCardTextColumn({
    this.movieTitle,
    this.movieDirector,
    this.movieGenres,
    this.movieDuration,
    this.movieRating
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(movieTitle), // Movie Title
        Text(movieDirector), // Movie Director
        // TODO: Add Rating
        Container( // Container for the rating
          height: 39,
        ),
        // TODO: Row with genres and duration
        Container( // Text row container
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(movieGenres),
              Text(movieDuration),
            ],
          ),
        ),
      ],
    );
  }
}