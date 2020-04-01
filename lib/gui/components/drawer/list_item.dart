import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviehub/models/account.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ListItemContent{
  DISCOVER,
  SEARCH,
  LIST,
  STATISTICS,
  NIGHT_MODE,
  LOGOUT,
  LOGIN
}

// ignore: must_be_immutable
class ListItem extends StatefulWidget {
  @override
  _ListItemState createState() => _ListItemState();

  String title;
  VoidCallback onTap;
  ListItemContent content;

  ListItem({this.title, this.onTap, this.content});
}

class _ListItemState extends State<ListItem> {

  String title = "";
  Icon icon;
  bool hasSlider;


  @override
  void didUpdateWidget(ListItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    this.title = widget.title;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        width: 300,
        height: 77,
        child: Container(
          margin: EdgeInsets.only(left: 34, right: 34),
          child: Row(
            children: <Widget>[
              icon,
              SizedBox(width: 30),
              Text(title),
              Spacer(),
              buildSlider()
            ],
          ),
        ),
      ),
    );
  }

  @override
  // ignore: must_call_super
  void didChangeDependencies() {
    handleTitle();
    handleIcon();
  }

  void handleTitle() async {
    if (widget.content == ListItemContent.DISCOVER) title = "Discover";
    if (widget.content == ListItemContent.SEARCH) title = "Search";
    if (widget.content == ListItemContent.LIST) title = "List";
    if (widget.content == ListItemContent.STATISTICS) title = "Statistics";
    if (widget.content == ListItemContent.NIGHT_MODE) title = "Night Mode";
    if (widget.content == ListItemContent.LOGOUT) title = "Logout";
    if (widget.content == ListItemContent.LOGIN) title = "Login";
  }

  void handleIcon() {
    if (widget.content == ListItemContent.DISCOVER) icon = Icon(Icons.explore, size: 20,);
    if (widget.content == ListItemContent.SEARCH) icon = Icon(Icons.search, size: 20,);
    if (widget.content == ListItemContent.LIST) icon = Icon(Icons.list, size: 20,);
    if (widget.content == ListItemContent.STATISTICS) icon = Icon(Icons.insert_chart, size: 20,);
    if (widget.content == ListItemContent.NIGHT_MODE) icon = Icon(Icons.brightness_2, size: 20,);
    if (widget.content == ListItemContent.LOGOUT) icon = Icon(Icons.chevron_left, size: 20,);
    if (widget.content == ListItemContent.LOGIN) icon = Icon(Icons.account_circle, size: 20,);
  }

  Widget buildSlider() {
    if (widget.content == ListItemContent.NIGHT_MODE) {
      return Switch(
        value: Theme.of(context).brightness == Brightness.dark,
      );
    }
    return Container();
  }
}
