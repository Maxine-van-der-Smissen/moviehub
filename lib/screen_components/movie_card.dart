import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 378,
      height: 170,
      color: Colors.red,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Theme.of(context).backgroundColor,
        ),
        width: 38,
        height: 16,
      ),
    );
  }
}