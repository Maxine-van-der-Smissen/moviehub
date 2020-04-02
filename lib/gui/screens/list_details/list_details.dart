import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviehub/gui/components/app_bar/main_app_bar.dart';
import 'package:moviehub/gui/components/movie_card/movie_card.dart';
import 'package:moviehub/models/movie.dart';

// ignore: must_be_immutable
class ListDetails extends StatefulWidget {
  List<MovieCardModel> listItems;
  ListDetails(this.listItems);

  @override
  _ListDetailsState createState() => _ListDetailsState();
}

class _ListDetailsState extends State<ListDetails> {
  Widget movieWidget = Container();
  List<MovieCardModel> movies;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadMovies();
  }

  void loadMovies() async {
    setState(() {
      movieWidget = Container(
        width: 1000,
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
            itemCount: widget.listItems.length,
            itemBuilder: (context, i) {
              return MovieCard(movie: widget.listItems[i]);
            }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 15,right: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: Container(
                  margin: EdgeInsets.only(left: 15, right: 15),
                  child: Text(
                    "List name",
                    style: TextStyle(
                        color: Color(0xFF3e3e3e),
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              movieWidget,
              SizedBox(height: 150,)
            ],
          ),
        ),
      ),
    );
  }
}
