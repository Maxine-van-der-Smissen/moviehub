import 'package:flutter/material.dart';

class MovieCardCover extends StatelessWidget {

  final String movieCoverURL;

  const MovieCardCover({
    this.movieCoverURL
  }) : super();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: FadeInImage(
<<<<<<< Updated upstream
        image: (movieCoverURL != null) ? NetworkImage(movieCoverURL) : AssetImage("images/default/default_cover.png"),
=======
        image: NetworkImage(movieCoverURL),
>>>>>>> Stashed changes
        placeholder: AssetImage("images/film_placeholder.png"),
      ),
    );
  }
}
