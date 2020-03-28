import 'package:flutter/material.dart';
import 'package:moviehub/gui/components/movie_card/movie_card_rating.dart';

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
        Text(
          movieTitle,
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFF3e3e3e),
            fontWeight: FontWeight.w500,
          ),
        ), // Movie Title
        Text(
          movieDirector,
          style: TextStyle(color: Color(0xFFAFAFAF)),
        ), // Movie Director
        Container(
          margin: EdgeInsets.only(top: 5),
          child: MovieCardRating(),
        ),
        Container(
          // Container for the rating
          height: 30,
        ),
        // TODO: Row with genres and duration
        Container(
          // Text row container
          child: Row(
            children: <Widget>[
              Text(
                movieGenres,
                style: TextStyle(color: Color(0xFFAFAFAF))),
              Spacer(),
              Text(
                movieDuration,
                style: TextStyle(
                  color: Color(0xFFAFAFAF),
                  fontWeight: FontWeight.w700
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
