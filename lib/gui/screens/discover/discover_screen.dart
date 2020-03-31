import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviehub/gui/components/buttons/option_button.dart';
import 'package:moviehub/gui/components/movie_card/movie_card.dart';
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
    preferences.setString("sort", "original_title.desc");
    preferences
        .setStringList("filters", ["year=2020", "vote_average.gte=5"]);
    String url = await NetworkUtils.urlBuilder("discover/movie", preferences);
    movies = await NetworkUtils.fetchMovies(url);
    setState(() {
      movieWidget = Container(
        width: 1000,
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(itemCount: movies.length ,itemBuilder: (context, i) {
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
          Container(
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
                    OptionButton(Icon(
                      Icons.sort_by_alpha,
                      size: 18,
                    )),
                    SizedBox(
                      width: 12,
                    ),
                    OptionButton(Icon(
                      Icons.filter_list,
                      size: 18,
                    )),
                  ],
                ),
              ],
            ),
          ),
          movieWidget,
        ],
      ),
    );
  }
}
