import 'package:flutter/cupertino.dart';
import 'package:moviehub/utils/network_utils.dart';
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
