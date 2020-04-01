import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileImage extends StatelessWidget {

  String url;

  ProfileImage({this.url});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 24,
      backgroundColor: Color(0xFFF9E7C3),
      backgroundImage: (url != null) ? NetworkImage(this.url) : AssetImage("images/default/default_profile.png"),
    );
  }
}
