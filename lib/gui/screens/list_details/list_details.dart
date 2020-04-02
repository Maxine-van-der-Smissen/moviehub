import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviehub/gui/components/app_bar/list_detail_app_bar.dart';
import 'package:moviehub/gui/components/movie_card/movie_card.dart';
import 'package:moviehub/gui/components/text/page_title.dart';
import 'package:moviehub/gui/components/text/text_title.dart';
import 'package:moviehub/models/list.dart';
import 'package:moviehub/models/movie.dart';
import 'package:moviehub/utils/network_utils.dart';

// ignore: must_be_immutable
class ListDetails extends StatefulWidget {
  String listName;
  List<MovieCardModel> listItems;

  ListDetails(this.listItems, this.listName);

  @override
  _ListDetailsState createState() => _ListDetailsState();
}

class _ListDetailsState extends State<ListDetails> {
  Widget movieWidget = Container();
  List<MovieCardModel> movies;
  List<ListCardModel> lists = List();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if(lists.isEmpty) loadLists();
    loadMovies();
  }

  void loadLists() async {
    NetworkUtils.fetchLists().then((fetchedLists) => {
      lists.addAll(fetchedLists)
    });
  }

  void loadMovies() async {
    setState(() {
      movieWidget = Container(
        width: 1000,
        height: MediaQuery.of(context).size.height - 195,
        child: ListView.builder(
          itemCount: widget.listItems.length,
          itemBuilder: (context, i) {
            return MovieCard(movie: widget.listItems[i], lists: lists,);
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ListDetailAppBar(),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          margin: EdgeInsets.only(left: 15, right: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Container(
                  margin: EdgeInsets.only(top: 50, left: 15, right: 15),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: PageTitle(widget.listName),
                  ),
                ),
              ),
              movieWidget,
              SizedBox(
                height: 150,
              )
            ],
          ),
        ),
      ),
    );
  }
}
