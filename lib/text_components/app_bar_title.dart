import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Movie",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w200,
            ),
          ),
          Text("Hub", style: TextStyle(
            color: Colors.white,
            fontSize: 18
          ),)
        ],
      ),
    );
    return null;
  }
}
