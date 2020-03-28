import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MovieCardTextColumn extends StatelessWidget {
  final String movieTitle;
  final String movieDirector;
  final String movieGenres;
  final String movieDuration;
  final int movieRating;

  const MovieCardTextColumn(
      {this.movieTitle,
      this.movieDirector,
      this.movieGenres,
      this.movieDuration,
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
          movieDirector,
          style: TextStyle(color: Color(0xFFAFAFAF)),
        ), // Movie Director
        RatingBar(
          initialRating: 3,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemSize: 18.0,
          itemCount: 5,
          itemPadding: EdgeInsets.symmetric(horizontal: 2.5),
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            print(rating);
          },
        ),
        Container(
          // Container for the rating
          height: 39,
        ),
        // TODO: Row with genres and duration
        Container(
          // Text row container
          child: Row(
            children: <Widget>[
              Text(movieGenres),
              Spacer(),
              Text(movieDuration),
            ],
          ),
        ),
      ],
    );
  }
}
