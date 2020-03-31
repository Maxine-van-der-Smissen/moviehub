import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GoBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      height: 35,
      decoration: BoxDecoration(
        color: Color(0xFF3e3e3e3e).withOpacity(0.8),
        borderRadius: BorderRadius.circular(100),
      ),
      margin: EdgeInsets.only(top: 20, left: 15),
      child: FlatButton(
        padding: EdgeInsets.only(left: 0),
        child: Icon(Icons.chevron_left,color: Color(0xFFFFFFFF),),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}