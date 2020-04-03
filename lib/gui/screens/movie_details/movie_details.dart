import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviehub/gui/components/buttons/back_button.dart';
import 'package:moviehub/gui/components/dialogs/add_movie_to_list_dialog.dart';
import 'package:moviehub/gui/components/dialogs/login_dialog.dart';
import 'package:moviehub/gui/screens/movie_details/components/movie_cast.dart';
import 'package:moviehub/gui/screens/movie_details/components/movie_cover.dart';
import 'package:moviehub/gui/screens/movie_details/components/movie_details_header.dart';
import 'package:moviehub/gui/screens/movie_details/components/movie_ratings.dart';
import 'package:moviehub/gui/screens/movie_details/components/movie_synopsis.dart';
import 'package:moviehub/models/list.dart';
import 'package:moviehub/models/movie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components/movie_backdrop.dart';
import 'components/movie_genre.dart';
import 'components/movie_settings.dart';

// ignore: must_be_immutable
class MovieDetails extends StatelessWidget {
  MovieDetailsModel movieDetails;
  MovieDetailsHeaderModel movieDetailsHeader;
  List<ListCardModel> lists;

  MovieDetails(details, lists) {
    this.lists = lists;
    this.movieDetails = details;
    this.movieDetailsHeader = MovieDetailsHeaderModel(
        movieDetails.movieTitle,
        movieDetails.movieDirector,
        movieDetails.movieReleaseDate,
        movieDetails.movieDuration,
        movieDetails.movieRating);
  }

  void handleAdd(BuildContext context, String selected) async {
    if (selected == "Options.addToList") {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      bool loggedIn = preferences.getString("account") != null;
      showDialog(
        context: context,
        builder: (BuildContext context) => loggedIn
            ? AddMovieToListDialog(
                onListAdd: () => print("Callback"),
                movieId: movieDetails.movieId,
                lists: lists)
            : LoginDialog(
                updateLogin: () => null,
              ),
      );
    }
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
                                Container(
                                  margin: EdgeInsets.only(right: 10),
                                  width: 35,
                                  height: 100,
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: Container(
                                        width: 35,
                                        child: MovieSettings(
                                          selectionCallback: handleAdd,
                                        )),
                                  ),
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
                    (movieDetails.movieGenres.isNotEmpty)
                        ? MovieGenres(movieDetails.movieGenres)
                        : Text(""),
                    SizedBox(
                      height: 10,
                    ),
                    MovieSynopsis(movieDetails.movieSynopsis),
                    SizedBox(
                      height: 25,
                    ),
                    (movieDetails.movieCast.length != 0)
                        ? MovieCast(movieDetails.movieCast)
                        : Text(""),
                    SizedBox(
                      height: 25,
                    ),
                    MovieRatings(
                      votes: movieDetails.movieRatingCount,
                      rating: movieDetails.movieRating,
                    ),
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
