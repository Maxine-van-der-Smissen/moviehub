import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 14),
      child: CircleAvatar(
        radius: 22,
        backgroundColor: Color(0xFFF9E7C3),
        child: ClipOval(
          child: FadeInImage(
            image: NetworkImage("https://i.imgur.com/PxHswVk.jpg"),
            placeholder: AssetImage("images/profile_placeholder.png"),
          ),
        ),
      ),
    );
  }
}