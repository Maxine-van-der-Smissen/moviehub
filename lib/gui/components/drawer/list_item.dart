import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum ListItemContent{
  DISCOVER,
  SEARCH,
  LIST,
  STATISTICS,
  NIGHT_MODE,
  LOGOUT
}

class ListItem extends StatefulWidget {
  @override
  _ListItemState createState() => _ListItemState();

  VoidCallback onTap;
  ListItemContent content;


  ListItem({this.onTap, this.content});

}

class _ListItemState extends State<ListItem> {

  String title = "";
  Icon icon;
  bool hasSlider;


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
  void didChangeDependencies() {
    handleTitle();
    handleIcon();
  }

  void handleTitle() {
    if (widget.content == ListItemContent.DISCOVER) title = "Discover";
    if (widget.content == ListItemContent.SEARCH) title = "Search";
    if (widget.content == ListItemContent.LIST) title = "List";
    if (widget.content == ListItemContent.STATISTICS) title = "Statistics";
    if (widget.content == ListItemContent.NIGHT_MODE) title = "Night Mode";
    if (widget.content == ListItemContent.LOGOUT) title = "Logout";
  }

  void handleIcon() {
    if (widget.content == ListItemContent.DISCOVER) icon = Icon(Icons.explore, size: 20,);
    if (widget.content == ListItemContent.SEARCH) icon = Icon(Icons.search, size: 20,);
    if (widget.content == ListItemContent.LIST) icon = Icon(Icons.list, size: 20,);
    if (widget.content == ListItemContent.STATISTICS) icon = Icon(Icons.insert_chart, size: 20,);
    if (widget.content == ListItemContent.NIGHT_MODE) icon = Icon(Icons.brightness_2, size: 20,);
    if (widget.content == ListItemContent.LOGOUT) icon = Icon(Icons.chevron_left, size: 20,);
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
