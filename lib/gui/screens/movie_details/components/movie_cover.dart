import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MovieCover extends StatelessWidget {
  String coverURL;
  MovieCover(url) : this.coverURL = url;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            spreadRadius: 0,
            offset: Offset(
              0.0,
              2.0,
            ),
            blurRadius: 4,
          )
        ],
        color: Theme.of(context).backgroundColor,
      ),
      width: 125,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: (coverURL == null) ? Image.asset("images/default/default_cover.png") : Image.network(coverURL),
      ),
    );
  }
}
