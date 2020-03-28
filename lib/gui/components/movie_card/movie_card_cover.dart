import 'package:flutter/material.dart';

class MovieCardCover extends StatelessWidget {

  final String movieCoverURL;

  const MovieCardCover({
    this.movieCoverURL
  }) : super();

  @override
  Widget build(BuildContext context) {
    // TODO: Round the corners of the cover
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: FadeInImage(
        image: NetworkImage(movieCoverURL),
        placeholder: AssetImage("images/film_placeholder.png"), // TODO: Better offline image
      ),
    );
  }
}