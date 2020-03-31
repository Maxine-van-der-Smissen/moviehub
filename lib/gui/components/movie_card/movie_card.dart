import 'package:flutter/material.dart';
import 'package:moviehub/gui/screens/movie_details/movie_details.dart';
import 'package:moviehub/models/movie.dart';
import 'package:moviehub/utils/network_utils.dart';

import 'movie_card_cover.dart';
import 'movie_card_text_column.dart';

class MovieCard extends StatelessWidget {
  final MovieCardModel movie;

  const MovieCard({this.movie}) : super();

  @override
  Widget build(BuildContext context) {
    // TODO: Text Style and refactor code into multiple modules / files
    return GestureDetector(
      onTap: () async {
        MovieDetailsModel movieDetails =
            await NetworkUtils.fetchMovieDetails(movie.movieId);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MovieDetails(movieDetails)));
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
                      blurRadius: 10)
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
