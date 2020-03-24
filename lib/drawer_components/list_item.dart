import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListItem extends StatefulWidget {
  @override
  _ListItemState createState() => _ListItemState();

  VoidCallback onTap;

  ListItem({this.onTap});

}

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        width: 300,
        height: 77,
        child: GestureDetector(
          child: Row(
            children: <Widget>[
              SizedBox(width: 34),
              Icon(Icons.movie),
              SizedBox(width: 30),
              Text("Movies")
            ],
          ),
        ),
      ),
    );
  }
}
