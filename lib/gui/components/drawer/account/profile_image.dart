import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 28,
      backgroundColor: Color(0xFFF9E7C3),
      backgroundImage: NetworkImage("https://i.imgur.com/PpKQWae.png"),
    );
  }
}
