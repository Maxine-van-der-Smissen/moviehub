import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moviehub/list_screen/list_screen.dart';
import 'package:moviehub/screen_components/base_screen.dart';
import 'package:moviehub/screen_components/search_bar.dart';

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

  MaterialColor white = const MaterialColor(
    0xFFFFFFFF,
    const <int, Color>{
      50: const Color(0xFFFFFFFF),
      100: const Color(0xFFFFFFFF),
      200: const Color(0xFFFFFFFF),
      300: const Color(0xFFFFFFFF),
      400: const Color(0xFFFFFFFF),
      500: const Color(0xFFFFFFFF),
      600: const Color(0xFFFFFFFF),
      700: const Color(0xFFFFFFFF),
      800: const Color(0xFFFFFFFF),
      900: const Color(0xFFFFFFFF),
    },
  );

  Brightness brightness = Brightness.dark;

  void switchTheme() {
    setState(() {
      brightness =
      brightness == Brightness.dark ? Brightness.light : Brightness.dark;
    },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(
        primarySwatch: white,
        brightness: brightness,
      ),
      home: BaseScreen(
        changeTheme: () => switchTheme(),
        child: Column(
          children: <Widget>[
            SearchBar(), //Contents of screen
          ],
        ),
      ),
    );
  }
}
