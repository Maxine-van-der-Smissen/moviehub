import 'package:flutter/material.dart';
import 'package:moviehub/app_bar/main_app_bar.dart';
import 'package:moviehub/screen_components/search_bar.dart';
import 'package:moviehub/text_components/app_bar_title.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xFFDC9B16), //or set color with: Color(0xFF0000FF)
    ));
    return MaterialApp(
      home: MyHomePage(title: 'MovieHub'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: Container(
        margin: EdgeInsets.only(left: 14, right: 14, top: 35),
        child: Column(
          children: <Widget>[
            SearchBar()
          ],
        ),
      ),
    );
  }
}
