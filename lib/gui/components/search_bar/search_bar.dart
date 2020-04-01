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
    super.dispose();
    textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.05),
              spreadRadius: 0,
              blurRadius: 5)
        ],
        color: Theme.of(context).backgroundColor,
      ),
      child: TextField(
        onSubmitted: null,
        controller: textController,
        decoration: InputDecoration(
          fillColor: Colors.white,
          suffixIcon: Icon(
            Icons.search,
            size: 20,
          ),
          enabledBorder: new OutlineInputBorder(
            borderSide: BorderSide(
                color: Theme.of(context).backgroundColor, width: 5.0),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          border: new OutlineInputBorder(
            borderSide: BorderSide(
                color: Theme.of(context).backgroundColor, width: 5.0),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          labelText: "Search for movies",
          labelStyle: TextStyle(
            color: Color(0xFFCCCCCC)
          )
        ),
      ),
    );
  }
}
