import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviehub/gui/components/text/card_title.dart';
import 'package:moviehub/gui/components/text/text_title.dart';

// ignore: must_be_immutable
class HighestRatedLists extends StatelessWidget {
  String highestRatedListName;
  double highestRatedListRating;

  HighestRatedLists(this.highestRatedListName, this.highestRatedListRating);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
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
              child: CardTitle("Highest rated list"),
            ),
            SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                highestRatedListRating.toString(),
                style: TextStyle(
                  color: Color(0xFF3e3e3e),
                  fontSize: 40.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                highestRatedListName,
                style: TextStyle(
                  color: Color(0xFF3e3e3e).withOpacity(0.6),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
