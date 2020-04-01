import 'package:flutter/cupertino.dart';
import 'package:moviehub/gui/components/rating/movie_rating.dart';
import 'package:moviehub/gui/components/text/text_title.dart';

class MovieRatings extends StatelessWidget {
  int votes;
  double rating;

  MovieRatings({this.votes, this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextTitle("Rating votes"),
          SizedBox(
            height: 10,
          ),
          Row(
            children: <Widget>[
              Text(
                rating.toString(),
                style: TextStyle(color: Color(0xFF3e3e3e), fontSize: 42),
              ),
              Container(
                margin: EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    MovieRating(rating),
                    Text(
                      "Votes: ${votes}",
                      style: TextStyle(
                          height: 1.65, color: Color(0xFF000000).withOpacity(0.45), fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
