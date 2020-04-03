import 'package:flutter/material.dart';
import 'package:moviehub/gui/components/text/card_title.dart';
import 'package:moviehub/models/genres.dart';
import 'package:moviehub/utils/localizations.dart';

// ignore: must_be_immutable
class TopGenresInLists extends StatelessWidget {
  List<Genre> genres;

  int listLength;

  TopGenresInLists(genres) {
    this.genres = genres;
    listLength = (genres.length > 3) ? 3 : genres.length;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 0,
            blurRadius: 10,
          ),
        ],
        color: Theme.of(context).backgroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(35.0),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: CardTitle(MovieHubLocalizations.of(context)
                  .translate("statistics_screen_top_genres")),
            ),
            SizedBox(height: 10),
            Column(
              children: <Widget>[
                for (int i = 0; i < listLength; i++)
                  Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "${i + 1}. ${genres[i].name}",
                          style: TextStyle(
                            color: Color(0xFF3e3e3e).withOpacity(0.6),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
