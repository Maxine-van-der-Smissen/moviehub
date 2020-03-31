import 'package:flutter/material.dart';
import 'movie_card_rating.dart';

class MovieCardTextColumn extends StatelessWidget {
  final String movieTitle;
  final String movieGenres;
  final String movieReleaseDate;
  final double movieRating;

  const MovieCardTextColumn(
      {this.movieTitle,
      this.movieGenres,
      this.movieReleaseDate,
      this.movieRating})
      : super();

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
          "", // TODO: Remove or put something else here
          style: TextStyle(color: Color(0xFFAFAFAF)),
        ), // Movie Director
        Container(
          margin: EdgeInsets.only(top: 5),
          child: MovieCardRating(movieRating),
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
              Text(movieGenres, style: TextStyle(color: Color(0xFFAFAFAF))),
              Spacer(),
              Text(
                movieReleaseDate,
                style: TextStyle(
                    color: Color(0xFFAFAFAF), fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
