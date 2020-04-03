import 'dart:convert';

import 'package:moviehub/models/genres.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StatisticsModel {
  final List<Genre> topGenresInLists;
  final String highestRatedListName;
  final double highestRatedListRating;
  final double averageMovieRating;

  StatisticsModel(this.topGenresInLists, this.highestRatedListName,
      this.highestRatedListRating, this.averageMovieRating);

  static void saveStatistics(StatisticsModel statistics) async {
    SharedPreferences.getInstance().then((preferences) => {
          preferences.setString(
              "statistics",
              jsonEncode({
                statistics.topGenresInLists,
                statistics.highestRatedListName,
                statistics.highestRatedListRating,
                statistics.averageMovieRating
              }))
        });
  }

  static Future<StatisticsModel> fromJson() async {
    String statisticsJsonString = await SharedPreferences.getInstance()
        .then((preferences) => preferences.getString("statistics"));
    if (statisticsJsonString == null || statisticsJsonString.isEmpty)
      return null;
    Map<String, dynamic> json = jsonDecode(statisticsJsonString);

    return StatisticsModel(
        json["topGenresInLists"] as List<Genre>,
        json["longestListName"] as String,
        json["longestListDuration"] as double,
        json["averageMovieDuration"] as double);
  }
}
