import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviehub/gui/components/movie_card/movie_card.dart';
import 'package:moviehub/gui/components/search_bar/search_bar.dart';
import 'package:moviehub/models/list.dart';
import 'package:moviehub/models/movie.dart';
import 'package:moviehub/utils/data.dart';
import 'package:moviehub/utils/localizations.dart';
import 'package:moviehub/utils/network_utils.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  Widget movieWidget = Container();
  List<MovieCardModel> movies;
  List<ListCardModel> lists = List();

  Widget resultsForSearchTerm = Container();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (lists.isEmpty) loadLists();
  }

  void loadLists() async {
    NetworkUtils.fetchLists()
        .then((fetchedLists) => {lists.addAll(fetchedLists)});
  }

  void updateSearchTerm(String searchTerm, bool results) {
    setState(() {
      resultsForSearchTerm = RichText(
        text: TextSpan(
          text: (results)
              ? MovieHubLocalizations.of(context)
                  .translate("search_screen_results")
              : MovieHubLocalizations.of(context)
                  .translate("search_screen_no_results"),
          style: TextStyle(
            color: Color(0xFF3e3e3e),
            fontSize: 16,
          ),
          children: <TextSpan>[
            TextSpan(
              text: '"${searchTerm.trim()}"',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF3e3e3e),
                fontSize: 16,
              ),
            ),
          ],
        ),
      );
    });
  }

  void loadMovies(String query) async {
    String url =
        await NetworkUtils.urlBuilder(URLBuilderType.SEARCH, query: query);
    movies = await NetworkUtils.fetchMovies(url, URLBuilderType.SEARCH);
    (movies.length != 0)
        ? updateSearchTerm(query, true)
        : updateSearchTerm(query, false);
    setState(() {
      movieWidget = Container(
        width: 1000,
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, i) {
              return MovieCardAddToList(movies[i], lists);
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
            child: Column(
              children: <Widget>[
                SearchBar(
                  callback: loadMovies,
                ),
                SizedBox(
                  height: 35,
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: resultsForSearchTerm,
                  ),
                ),
              ],
            ),
          ),
          movieWidget
        ],
      ),
    );
  }
}
