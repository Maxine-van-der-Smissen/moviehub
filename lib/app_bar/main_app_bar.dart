import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviehub/text_components/app_bar_title.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 64,
        width: MediaQuery.of(context).size.width,
        color: Color(0xFFF4B127),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Icon(Icons.menu, color: Colors.white,),
            ),
            Center(child: AppBarTitle()),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize {
    return Size.fromHeight(64);
  }
}
