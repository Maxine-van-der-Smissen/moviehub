import 'package:flutter/material.dart';
import '../rating/movie_rating.dart';

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
        Container(
          margin: EdgeInsets.only(right: 25),
          child: Text(
            movieTitle,
            maxLines: 2,
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF3e3e3e),
              fontWeight: FontWeight.w500,
            ),
          ),
        ), // Movie Title
        SizedBox(height: 0,),
        Text(
          (movieReleaseDate != null) ? movieReleaseDate : "",
          style: TextStyle(
              color: Color(0xFFAFAFAF),),
        ),
        SizedBox(height: 5,),
        MovieRating(movieRating),
        Container(
          // Container for the rating
          height: 30,
        ),
        Container(
          // Text row container
          child: Container(
              child: Text(
                  movieGenres,
                  maxLines: 1,
                  style: TextStyle(color: Color(0xFFAFAFAF)))),
        ),
      ],
    );
  }
}
