import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        height: 170,
        color: Colors.red,
        child: Row(
          children: <Widget>[
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Theme.of(context).backgroundColor,
                ),
                width: MediaQuery.of(context).size.width,
                height: 146,
              ),
            ),
          ],
        ),
      ),
    );
  }
}