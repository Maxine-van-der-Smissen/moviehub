import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviehub/gui/components/app_bar/main_app_bar.dart';
import 'package:moviehub/gui/components/drawer/list_item.dart';
import 'package:moviehub/gui/components/login_screen/login_dialog.dart';
import 'package:moviehub/gui/screens/created_lists/list_screen.dart';
import 'package:moviehub/gui/screens/discover/discover_screen.dart';
import 'package:moviehub/gui/screens/search/search_screen.dart';

// ignore: must_be_immutable
class BaseScreen extends StatefulWidget {
  Widget child;
  Widget accountTab;
  Widget loginButton;

  BaseScreen({this.child, this.changeTheme, this.accountTab, this.loginButton});

  VoidCallback changeTheme;

  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  void openDrawer() {
    _drawerKey.currentState.openDrawer();
  }

  void changeScreen(ListItemContent content, BuildContext context) {
    Navigator.pop(context);
    setState(() {
      if (content == ListItemContent.DISCOVER) widget.child = DiscoverScreen();
      if (content == ListItemContent.SEARCH) widget.child = SearchScreen();
      if (content == ListItemContent.LIST) widget.child = ListScreen();
      if (content == ListItemContent.NIGHT_MODE) return;
    });
  }

  void login() {
    showDialog(
      context: context,
      builder: (BuildContext context) => LoginDialog(updateLogin: () => {
        context
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawer: SafeArea(
        child: Container(
          width: 300,
          child: Drawer(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  widget.accountTab,
                  ListItem(
                    content: ListItemContent.DISCOVER,
                    onTap: () => changeScreen(ListItemContent.DISCOVER, context),
                  ),
                  ListItem(
                    content: ListItemContent.SEARCH,
                    onTap: () => changeScreen(ListItemContent.SEARCH, context),
                  ),
                  ListItem(
                    onTap: () => changeScreen(ListItemContent.LIST, context),
                    content: ListItemContent.LIST,
                  ),
                  ListItem(
                    content: ListItemContent.STATISTICS,
                  ),
                  ListItem(
                    onTap: () => widget.changeTheme(),
                    content: ListItemContent.NIGHT_MODE,
                  ),
                  widget.loginButton,
                ],
              ),
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
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
