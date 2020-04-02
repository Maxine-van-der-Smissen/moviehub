import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviehub/gui/components/buttons/back_button.dart';
import 'package:moviehub/gui/screens/movie_details/components/movie_cast.dart';
import 'package:moviehub/gui/screens/movie_details/components/movie_cover.dart';
import 'package:moviehub/gui/screens/movie_details/components/movie_details_header.dart';
import 'package:moviehub/gui/screens/movie_details/components/movie_ratings.dart';
import 'package:moviehub/gui/screens/movie_details/components/movie_synopsis.dart';
import 'package:moviehub/models/movie.dart';

import 'components/movie_backdrop.dart';
import 'components/movie_genre.dart';

// ignore: must_be_immutable
class MovieDetails extends StatelessWidget {
  MovieDetailsModel movieDetails;
  MovieDetailsHeaderModel movieDetailsHeader;

  MovieDetails(details) {
    this.movieDetails = details;
    this.movieDetailsHeader = MovieDetailsHeaderModel(
        movieDetails.movieTitle,
        movieDetails.movieDirector,
        movieDetails.movieReleaseDate,
        movieDetails.movieDuration,
        movieDetails.movieRating);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 400,
                child: Stack(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        MovieBackdrop(movieDetails.movieBackdropURL),
                        GoBackButton(),
                      ],
                    ),
                    Positioned(
                      top: 200,
                      child: Container(
                        margin: EdgeInsets.only(left: 15, right: 15),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                MovieCover(movieDetails.movieCoverURL),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: 45, left: 20, right: 15),
                                  child: MovieDetailsHeader(movieDetailsHeader),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 15, right: 15, bottom: 55),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    MovieGenres(movieDetails.movieGenres),
                    SizedBox(
                      height: 10,
                    ),
                    MovieSynopsis(movieDetails.movieSynopsis),
                    SizedBox(
                      height: 25,
                    ),
                    (movieDetails.movieCast.length != 0) ? MovieCast(movieDetails.movieCast) : Text(""),
                    SizedBox(
                      height: 25,
                    ),
                    MovieRatings(votes: movieDetails.movieRatingCount, rating: movieDetails.movieRating,),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
