import 'package:flutter/material.dart';
import 'package:moviehub/gui/components/dialogs/add_movie_to_list_dialog.dart';
import 'package:moviehub/gui/screens/movie_details/movie_details.dart';
import 'package:moviehub/models/list.dart';
import 'package:moviehub/models/movie.dart';
import 'package:moviehub/utils/network_utils.dart';

import 'movie_card_cover.dart';
import 'movie_card_text_column.dart';

// ignore: must_be_immutable
class MovieCard extends StatelessWidget {
  final MovieCardModel movie;
  List<ListCardModel> lists;

  MovieCard({this.movie, this.lists});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        MovieDetailsModel movieDetails =
            await NetworkUtils.fetchMovieDetails(movie.movieId);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieDetails(movieDetails),
          ),
        );
      },
      child: Container(
        // Main Container
        margin: EdgeInsets.only(top: 22),
        height: 170,
        width: MediaQuery.of(context).size.width,
        color: Colors.transparent,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Container(
              // White Text container
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    spreadRadius: 0,
                    blurRadius: 10,
                  ),
                ],
                borderRadius: BorderRadius.circular(5),
                color: Theme.of(context).backgroundColor,
              ),
              height: 150,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  // Text column container
                  margin: EdgeInsets.only(left: 125, right: 14),
                  child: MovieCardTextColumn(
                    movieTitle: movie.movieTitle,
                    movieGenres: movie.movieGenres,
                    movieReleaseDate: movie.movieReleaseDate,
                    movieRating: movie.movieRating,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, right: 5),
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 35,
                  child: FlatButton(
                    padding: EdgeInsets.all(0.0),
                    child: Icon(
                      Icons.playlist_add,
                      size: 20,
                      color: Color(0xFF3e3e3e).withOpacity(0.5),
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => AddMovieToListDialog(
                            onListAdd: () => print("Callback"),
                            movieId: movie.movieId,
                            lists: lists),
                      );
                    },
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
    );
  }
}
