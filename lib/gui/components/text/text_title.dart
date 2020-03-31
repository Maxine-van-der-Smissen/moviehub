import 'package:flutter/cupertino.dart';

class TextTitle extends StatelessWidget {
  String text;
  TextTitle(string) : this.text = string;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 18,
        color: Color(0xFF3e3e3e),
        fontWeight: FontWeight.w500,
      ),
    );
  }
}