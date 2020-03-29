import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MovieCardRating extends StatelessWidget {
  double movieRating;

  MovieCardRating(rating) : this.movieRating = rating;

  @override
  Widget build(BuildContext context) {
    return RatingBar(
      initialRating: movieRating,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemSize: 18.0,
      itemCount: 5,
      itemPadding: EdgeInsets.symmetric(horizontal: 2.5),
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Color(0xFFF4B127),
      ),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }
}
