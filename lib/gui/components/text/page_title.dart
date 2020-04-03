import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
class PageTitle extends StatelessWidget {
  String title;

  PageTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: Color(0xFF3e3e3e),
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
