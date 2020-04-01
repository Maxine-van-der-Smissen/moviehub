import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileImage extends StatelessWidget {

  String url;
  String defaultUrl = "https://i2.wp.com/www.depottenbakker.be/wp-content/uploads/2018/07/default-profile.png?fit=300%2C300&ssl=1";

  ProfileImage({this.url});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 24,
      backgroundColor: Color(0xFFF9E7C3),
      backgroundImage: NetworkImage((url == null) ? defaultUrl : this.url),
    );
  }
}
