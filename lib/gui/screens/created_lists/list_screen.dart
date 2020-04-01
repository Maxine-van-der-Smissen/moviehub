import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviehub/gui/components/list_card/list_card.dart';
import 'package:moviehub/gui/screens/created_lists/components/list_creation_dialog.dart';
import 'package:moviehub/models/list.dart';

// ignore: must_be_immutable
class ListScreen extends StatelessWidget {
  ListCardModel list =
      ListCardModel(1, 20, "Marvel Movies List", "Beschrijving");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListCard(list: list),
          ],
        ),
        floatingActionButton: Container(
          margin: EdgeInsets.only(bottom: 25, left: 25),
          child: FloatingActionButton(
            child: Icon(
              Icons.add,
              color: Color(0xFFFFFFFF),
            ),
            backgroundColor: Color(0xFFFF6F31),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => ListCreationDialog(),
              );
            },
          ),
        ),
      ),
    );
  }
}
