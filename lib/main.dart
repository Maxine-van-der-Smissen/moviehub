import 'package:flutter/material.dart';
import 'package:moviehub/app_bar/main_app_bar.dart';
import 'package:moviehub/drawer_components/account_tab.dart';
import 'package:moviehub/drawer_components/list_item.dart';
import 'package:moviehub/screen_components/search_bar.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xFFDC9B16), //or set color with: Color(0xFF0000FF)
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
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  Brightness brightness = Brightness.dark;

  void openDrawer() {
    _drawerKey.currentState.openDrawer();
  }

  void switchTheme() {
    setState(
      () {
        brightness =
            brightness == Brightness.dark ? Brightness.light : Brightness.dark;
      },
    );
  }

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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(
        primarySwatch: white,
        brightness: brightness,
      ),
      home: Scaffold(
        key: _drawerKey,
        drawer: SafeArea(
          child: Container(
            width: 300,
            child: Drawer(
              child: Column(
                children: <Widget>[
                  AccountTab(),
                  ListItem(
                    onTap: () => switchTheme(),
                  ),
                  ListItem(),
                  ListItem(),
                  ListItem(),
                  ListItem(),
                ],
              ),
            ),
          ),
        ),
        body: GestureDetector(
          onTap: () {
            WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
          },
          child: Scaffold(
            appBar: MainAppBar(openDrawer: () => openDrawer()),
            body: Container(
              margin: EdgeInsets.only(left: 14, right: 14, top: 35),
              child: Column(
                children: <Widget>[
                  SearchBar(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
