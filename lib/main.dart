import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'gui/colors/custom_material_color.dart';
import 'gui/components/base/base_screen.dart';
import 'gui/components/movie_card/movie_card.dart';
import 'gui/components/search_bar/search_bar.dart';
import 'models/movie.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xFFDC9B16),
    ));
    return MyHomePage(title: 'MovieHub');
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  SharedPreferences preferences;
  Brightness brightness;

  void loadTheme() async {
    preferences = await SharedPreferences.getInstance();
    bool dark = preferences.getBool("darkmode") ?? true;
    brightness = dark ? Brightness.dark : Brightness.light;
    print(dark);
  }

  void switchTheme() {
    setState(
      () {
        bool toDark = brightness != Brightness.dark;
        brightness = toDark ? Brightness.dark : Brightness.light;
        preferences.setBool("darkmode", toDark);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(
        primarySwatch: CustomMaterialColor().white,
        brightness: brightness,
      ),
      home: BaseScreen(
        changeTheme: () => switchTheme(),
        child: Column(
          children: <Widget>[
            SearchBar(), //Contents of screen
            MovieCard(
              movie: MovieCardModel(
                  movieId: 0,
                  movieTitle: "Mission: Impossible - Fallout",
                  movieGenres: "Action, Adventure",
                  movieReleaseDate: "02:28:00",
                  movieCoverURL:
                      "https://image.tmdb.org/t/p/w600_and_h900_bestv2/AkJQpZp9WoNdj7pLYSj1L0RcMMN.jpg",
                  movieRating: 4.5),
            ),
            MovieCard(
              movie: MovieCardModel(
                  movieId: 1,
                  movieTitle: "Mission: Impossible - Fallout",
                  movieGenres: "Action, Adventure",
                  movieReleaseDate: "02:28:00",
                  movieCoverURL:
                      "https://image.tmdb.org/t/p/w600_and_h900_bestv2/AkJQpZp9WoNdj7pLYSj1L0RcMMN.jpg",
                  movieRating: 2.5),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    loadTheme();
  }
}
