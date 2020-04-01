import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
class MovieBackdrop extends StatelessWidget {
  String coverURL;
  MovieBackdrop(url) : this.coverURL = url;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: (coverURL != null) ? Image.network(coverURL) : Image.asset("images/default/default_backdrop.png"),
    );
  }
}