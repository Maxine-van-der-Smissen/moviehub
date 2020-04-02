import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_bar_title.dart';

// ignore: must_be_immutable
class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  VoidCallback openDrawer;

  MainAppBar({this.openDrawer});

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
              margin: EdgeInsets.only(left: 12),
              child: IconButton(
                onPressed: openDrawer,
                icon: Icon(
                  Icons.menu,
                  size: 22,
                  color: Colors.white,
                ),
              ),
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
