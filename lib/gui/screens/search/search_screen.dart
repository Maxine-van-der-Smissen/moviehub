import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviehub/gui/components/movie_card/movie_card.dart';
import 'package:moviehub/gui/components/search_bar/search_bar.dart';
import 'package:moviehub/models/list.dart';
import 'package:moviehub/models/movie.dart';
import 'package:moviehub/utils/data.dart';
import 'package:moviehub/utils/network_utils.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  Widget movieWidget = Container();
  List<MovieCardModel> movies;
  List<ListCardModel> lists = List();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if(lists.isEmpty) loadLists();
  }

  void loadLists() async {
    NetworkUtils.fetchLists().then((fetchedLists) => {
      lists.addAll(fetchedLists)
    });
  }

  void loadMovies(String query) async {
    String url = await NetworkUtils.urlBuilder(URLBuilderType.SEARCH, query: query);
    movies = await NetworkUtils.fetchMovies(url, URLBuilderType.SEARCH);
    setState(() {
      movieWidget = Container(
        width: 1000,
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(itemCount: movies.length ,itemBuilder: (context, i) {
          return MovieCard(movie: movies[i], lists: lists);
        }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: SearchBar(callback: loadMovies,),
          ),
          movieWidget
        ],
      ),
    );
  }
}
