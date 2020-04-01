import 'package:flutter/material.dart';
import 'package:moviehub/gui/components/movie_card/movie_card_cover.dart';
import 'package:moviehub/gui/components/movie_card/movie_card_text_column.dart';
import 'package:moviehub/models/list.dart';
import 'package:moviehub/utils/network_utils.dart';

import 'list_card_text_column.dart';

class ListCard extends StatelessWidget {
  final ListCardModel list;

  const ListCard({this.list}) : super();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
//        MovieDetailsModel movieDetails =
//        await NetworkUtils.fetchMovieDetails(movie.movieId);
//        Navigator.push(
//            context,
//            MaterialPageRoute(
//                builder: (context) => MovieDetails(movieDetails)));
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
                  margin: EdgeInsets.only(left: 125, right: 14),
                  child: ListCardTextColumn(
                    movieCount: list.movieCount,
                    listTitle: list.name,
                    listDescription: list.description,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 12,
              top: 0,
              bottom: 12,
              child: MovieCardCover(),
            ),
          ],
        ),
      ),
    );
  }
}
