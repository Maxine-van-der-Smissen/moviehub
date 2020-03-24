import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final textController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        color: Colors.white,
        child: TextField(
          onSubmitted: null,
          controller: textController,
          decoration: InputDecoration(
            fillColor: Colors.white,
            enabledBorder: new OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 5.0),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            border: new OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 5.0),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            labelText: "Search for movies",
          ),
        ),
      ),
    );
    /*return Flexible(
      child: Container(
        decoration: BoxDecoration (
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        width: MediaQuery.of(context).size.width,
        height: 45,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 16),
              child: Text(
                "Search for movies",
                style: TextStyle(
                  color: Color(0xFFCCCCCC),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 16),
              child: Icon(
                Icons.search,
                color: Color(0xFFCCCCCC),
              ),
            ),
          ],
        ),
      ),
    );*/
  }
}
