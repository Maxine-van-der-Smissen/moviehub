import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviehub/models/genres.dart';

// ignore: must_be_immutable
class MovieGenres extends StatelessWidget {
  List<Genre> movieGenres;

  MovieGenres(this.movieGenres);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movieGenres.length,
        itemBuilder: (context, i) {
          return Row(
            children: <Widget>[
              MovieGenreItem(movieGenres[i].name),
              SizedBox(width: 15),
            ],
          );
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class MovieGenreItem extends StatelessWidget {
  String genreName;

  MovieGenreItem(this.genreName);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: Color(0xFFF4B127)
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            top: 7.0,
            bottom: 7.0,
          ),
          child: Text(
            genreName,
            style: TextStyle(color: Color(0xFFFFFFFF)),
          ),
        ),
      ),
    );
  }
}
