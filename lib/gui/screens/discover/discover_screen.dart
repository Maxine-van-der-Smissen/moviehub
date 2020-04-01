import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviehub/gui/components/buttons/option_button.dart';
import 'package:moviehub/gui/components/movie_card/movie_card.dart';
import 'package:moviehub/gui/screens/discover/components/filter_dialog.dart';
import 'package:moviehub/gui/screens/discover/components/sort_dialog.dart';
import 'package:moviehub/models/movie.dart';
import 'package:moviehub/utils/network_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DiscoverScreen extends StatefulWidget {
  @override
  _DiscoverScreenState createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  Widget movieWidget = Container();
  List<MovieCardModel> movies;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadMovies();
  }

  void loadMovies() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setStringList("filters", ["year=2020", "vote_average.gte=5"]);
    String url = await NetworkUtils.urlBuilder("discover/movie", preferences);
    movies = await NetworkUtils.fetchMovies(url);
    setState(() {
      movieWidget = Container(
        width: 1000,
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, i) {
              return MovieCard(movie: movies[i]);
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
            padding: const EdgeInsets.only(bottom: 15.0),
            child: Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              child: Row(
                children: <Widget>[
                  Text(
                    "Discover",
                    style: TextStyle(
                        color: Color(0xFF3e3e3e),
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                  Spacer(),
                  Row(
                    children: <Widget>[
                      Container(
                        width: 35,
                        child: FlatButton(
                          padding: EdgeInsets.all(0.0),
                          child: OptionButton(Icon(
                            Icons.sort_by_alpha,
                            size: 18,
                          )),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => SortDialog(onSortChange:() => loadMovies(),),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Container(
                        width: 35,
                        child: FlatButton(
                          padding: EdgeInsets.all(0.0),
                          child: OptionButton(
                            Icon(
                              Icons.filter_list,
                              size: 18,
                            ),
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => FilterDialog(),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          movieWidget,
        ],
      ),
    );
  }
}
