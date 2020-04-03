import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviehub/gui/screens/statistics/components/average_movie_rating.dart';
import 'package:moviehub/models/account.dart';
import 'package:moviehub/utils/network_utils.dart';
import 'components/highest_rated_list.dart';
import 'components/top_genres_in_lists.dart';

class StatisticsScreen extends StatefulWidget {
  @override
  _StatisticsScreenState createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  Widget statisticsWidget = Container();

  void didChangeDependencies() {
    super.didChangeDependencies();
    loadStatistics();
  }

  void loadStatistics() async {
    if (await Account.fromJson() == null) {
      setState(() {
        statisticsWidget = Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height - 250,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 200,
                  height: 200,
                  child: Image.asset("images/no_auth.png"),
                ),
                Text("To view statistics, you need to be authenticated", style: TextStyle(
                  color: Theme.of(context).brightness == Brightness.light ? Color(0xFF3E3E3E).withOpacity(0.45) : Colors.white,
                ),),
              ],
            ),
          ),
        );
      });
      return;
    }

    // TODO put loading of statistics somewhere else
    NetworkUtils.fetchStatistics().then(
      (statistics) => {
        print(statistics),
        setState(() {
          statisticsWidget = Container(
            margin: EdgeInsets.only(
              left: 15,
              right: 15,
            ),
            child: Column(
              children: <Widget>[
                TopGenresInLists(statistics.topGenresInLists),
                SizedBox(
                  height: 22,
                ),
                HighestRatedLists(statistics.highestRatedListName,
                    statistics.highestRatedListRating),
                SizedBox(
                  height: 22,
                ),
                AverageMovieRating(statistics.averageMovieRating),
              ],
            ),
          );
        })
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[statisticsWidget],
      ),
    );
  }
}
