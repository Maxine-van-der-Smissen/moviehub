import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviehub/models/account.dart';
import 'package:moviehub/models/list.dart';
import 'package:moviehub/utils/network_utils.dart';

// ignore: must_be_immutable
class ListCreationDialog extends StatefulWidget {
  Function(ListCardModel) callback;

  ListCreationDialog({this.callback});

  @override
  _ListCreationDialogState createState() => _ListCreationDialogState();
}

class _ListCreationDialogState extends State<ListCreationDialog> {
  final listNameController = TextEditingController();
  final listDescriptionController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    listNameController.dispose();
    listDescriptionController.dispose();
    super.dispose();
  }

  void createList(String name, String description) async {
    String sessionId =
        await Account.fromJson().then((account) => account.sessionId);
    ListCardModel newCreatedList =
        await NetworkUtils.createList(name, description, sessionId);
    if (newCreatedList != null) widget.callback(newCreatedList);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.only(
          top: 25,
          bottom: 25,
          left: 25,
          right: 15,
        ),
        decoration: new BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black26.withOpacity(0.3),
              blurRadius: 25.0,
            ),
          ],
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Create new list",
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF3e3e3e),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a list name';
                  }
                  return null;
                },
                controller: listNameController,
                decoration: InputDecoration(
                  labelText: 'Enter new list name',
                  labelStyle: TextStyle(
                    color: Color(0xFFCCCCCC),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a list description';
                  }
                  return null;
                },
                controller: listDescriptionController,
                decoration: InputDecoration(
                  labelText: 'Enter list description',
                  labelStyle: TextStyle(
                    color: Color(0xFFCCCCCC),
                  ),
                ),
              ),
              SizedBox(height: 26.0),
              Align(
                alignment: Alignment.bottomLeft,
                child: Row(
                  children: <Widget>[
                    FlatButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          createList(listNameController.text,
                              listDescriptionController.text);
                          Navigator.of(context).pop();
                        }
                      },
                      color: Color(0xFFFF6F31),
                      child: Text(
                        "Save",
                        style: TextStyle(color: Color(0xFFFFFFFF)),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Cancel"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
