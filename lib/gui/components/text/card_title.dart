import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
class CardTitle extends StatelessWidget {
  String title;

  CardTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18,
        color: Color(0xFF3e3e3e)
      ),
    );
  }
}