import 'package:flutter/material.dart';
import 'package:moviehub/utils/localizations.dart';
import '../rating/movie_rating.dart';

class ListCardTextColumn extends StatelessWidget {
  final String listTitle;
  final String listDescription;
  final int movieCount;

  const ListCardTextColumn({
    this.listTitle,
    this.listDescription,
    this.movieCount,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          listTitle,
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFF3e3e3e),
            fontWeight: FontWeight.w500,
          ),
        ), // Movie Title
        Text(
          listDescription,
          style: TextStyle(
            color: Color(0xFFAFAFAF),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          // Container for the rating
          height: 30,
        ),
        Text(
          "${MovieHubLocalizations.of(context).translate("list_card_text_column_movies")}: $movieCount",
          style: TextStyle(
            color: Color(0xFFAFAFAF),
          ),
        )
      ],
    );
  }
}
