import 'package:flutter/material.dart';

class MovieCardCover extends StatelessWidget {

  final String movieCoverURL;

  const MovieCardCover({
    this.movieCoverURL
  }) : super();

  @override
  Widget build(BuildContext context) {
    // TODO: Round the corners of the cover
    return FadeInImage(
      image: NetworkImage(movieCoverURL),
      placeholder: AssetImage("images/profile_placeholder.png"), // TODO: Better offline image
    );
  }
}