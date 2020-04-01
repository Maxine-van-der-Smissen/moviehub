import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moviehub/gui/components/drawer/account/account_tab.dart';
import 'package:moviehub/gui/screens/discover/discover_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'gui/colors/custom_material_color.dart';
import 'gui/components/base/base_screen.dart';
import 'gui/components/drawer/list_item.dart';

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
        child: DiscoverScreen(),
        accountTab: AccountTab(),
        loginButton: ListItem(
          content: ListItemContent.LOGOUT,
          onTap: () => login(),
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
