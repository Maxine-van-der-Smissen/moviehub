import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
class MovieBackdrop extends StatelessWidget {
  String coverURL;
  MovieBackdrop(url) : this.coverURL = url;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 231.5,
      width: MediaQuery.of(context).size.width,
      child: Image.network(coverURL),
    );
  }
}