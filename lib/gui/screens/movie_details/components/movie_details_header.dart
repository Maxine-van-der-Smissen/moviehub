import 'package:flutter/cupertino.dart';
import 'package:moviehub/gui/components/rating/movie_rating.dart';
import 'package:moviehub/gui/components/text/text_title.dart';
import 'package:moviehub/models/movie.dart';

// ignore: must_be_immutable
class MovieDetailsHeader extends StatelessWidget {
  MovieDetailsHeaderModel movieDetails;

  MovieDetailsHeader(this.movieDetails);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 190,
          child: TextTitle(movieDetails.movieTitle),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          movieDetails.movieDirector,
          style: TextStyle(
            color: Color(0xFF000000).withOpacity(0.45),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Text(movieDetails.movieReleaseDate),
        SizedBox(
          height: 5,
        ),
        Text(movieDetails.movieDuration),
        SizedBox(
          height: 10,
        ),
        MovieRating(movieDetails.movieRating),
      ],
    );
  }
}
