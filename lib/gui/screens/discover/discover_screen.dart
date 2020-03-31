import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviehub/gui/components/buttons/option_button.dart';
import 'package:moviehub/gui/components/movie_card/movie_card.dart';
import 'package:moviehub/models/movie.dart';

class DiscoverScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 15, right: 15),
            child: Row(
              children: <Widget>[
                Text(
                  "Discover",
                  style: TextStyle(
                      color: Color(0xFF3e3e3e),
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
                Spacer(),
                Row(
                  children: <Widget>[
                    OptionButton(Icon(Icons.sort_by_alpha, size: 18,)),
                    SizedBox(width: 12,),
                    OptionButton(Icon(Icons.filter_list, size: 18,)),
                  ],
                ),
              ],
            ),
          ),
          MovieCard(
            movie: MovieCardModel(
                movieId: 0,
                movieTitle: "Mission: Impossible - Fallout",
                movieGenres: "Action, Adventure",
                movieReleaseDate: "02:28:00",
                movieCoverURL:
                    "https://image.tmdb.org/t/p/w600_and_h900_bestv2/AkJQpZp9WoNdj7pLYSj1L0RcMMN.jpg",
                movieRating: 4.5),
          ),
        ],
      ),
    );
  }
}
