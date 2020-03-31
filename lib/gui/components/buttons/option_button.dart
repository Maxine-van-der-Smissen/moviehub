import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OptionButton extends StatelessWidget {
  Icon icon;
  OptionButton(icon) : this.icon = icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 0,
            blurRadius: 10,
          )
        ],
        color: Theme.of(context).backgroundColor,
      ),
      child: icon,
    );
  }
}