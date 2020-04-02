import 'package:flutter/material.dart';
import 'package:moviehub/gui/components/text/card_title.dart';
import 'package:moviehub/gui/components/text/text_title.dart';
import 'package:moviehub/models/genres.dart';

// ignore: must_be_immutable
class TopGenresInLists extends StatefulWidget {
  List<Genre> genres;

  TopGenresInLists(this.genres);

  @override
  _TopGenresInListsState createState() => _TopGenresInListsState();
}

class _TopGenresInListsState extends State<TopGenresInLists> {
  Widget topGenresWidget = Container();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    displayGenres();
  }

  void displayGenres() {
    setState(() {
      topGenresWidget = Container(
        width: 1000,
        height: 250,
        child: ListView.builder(
            itemCount: widget.genres.length,
            itemBuilder: (context, i) {
              return Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Text("${i + 1}. ${widget.genres[i].name}"),
              );
            }),
      );
    });
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
        padding:
            const EdgeInsets.all(35.0),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: CardTitle("Top genres in lists"),
            ),
            SizedBox(height: 10),
            topGenresWidget,
          ],
        ),
      ),
    );
  }
}
