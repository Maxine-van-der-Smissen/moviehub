import 'package:flutter/cupertino.dart';
import 'package:moviehub/gui/components/text/text_title.dart';

class MovieSynopsis extends StatelessWidget {
  String movieSynopsis;

  MovieSynopsis(synopsis) : this.movieSynopsis = synopsis;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.90,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextTitle("Synopsis"),
          SizedBox(
            height: 10,
          ),
          Text(
            movieSynopsis,
            style: TextStyle(
              height: 1.65,
              color: Color(0xFF000000).withOpacity(0.45)
            ),
          ),
        ],
      ),
    );
  }
}
