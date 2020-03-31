import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviehub/gui/components/app_bar/main_app_bar.dart';
import 'package:moviehub/gui/components/drawer/account/account_tab.dart';
import 'package:moviehub/gui/components/drawer/list_item.dart';
import 'package:moviehub/gui/components/search_bar/search_bar.dart';
import 'package:moviehub/gui/screens/list_screen/list_screen.dart';

class BaseScreen extends StatefulWidget {
  Widget child;

  BaseScreen({this.child, this.changeTheme});

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
    if (content == ListItemContent.NIGHT_MODE) return;
    Navigator.pop(context);
    //TODO, MAKE THIS DYNAMIC
    setState(() {
      if (content == ListItemContent.DISCOVER)
        widget.child = Column(
          children: <Widget>[
            SearchBar(),
          ],
        );
      if (content == ListItemContent.LIST) widget.child = ListScreen();
    });
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
                  AccountTab(),
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
                  ListItem(
                    content: ListItemContent.LOGOUT,
                  ),
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
