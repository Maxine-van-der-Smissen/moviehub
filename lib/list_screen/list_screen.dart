import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviehub/screen_components/base_screen.dart';

class ListScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BaseScreen (
      child: Text("Hello world", style: TextStyle(
        color: Colors.red,
      ),),
    );
  }
}