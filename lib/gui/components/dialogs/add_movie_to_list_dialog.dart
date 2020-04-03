import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviehub/models/account.dart';
import 'package:moviehub/models/list.dart';
import 'package:moviehub/utils/localizations.dart';
import 'package:moviehub/utils/network_utils.dart';

// ignore: must_be_immutable
class AddMovieToListDialog extends StatefulWidget {
  @override
  _AddMovieToListDialogState createState() => _AddMovieToListDialogState();

  VoidCallback onListAdd;
  int movieId;
  List<ListCardModel> lists;

  AddMovieToListDialog({this.onListAdd, this.movieId, this.lists});
}

class _AddMovieToListDialogState extends State<AddMovieToListDialog> {
  Widget listWidget = Container();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    displayLists();
  }

  void addMovieToList(int listId) async {
    String sessionId = await Account.fromJson().then((account) => account.sessionId);
    bool status = await NetworkUtils.addMovieToList(listId, widget.movieId, sessionId);
    if (status) Navigator.of(context).pop();
  }

  void displayLists() {
    setState(() {
      listWidget = Container(
        width: 1000,
        height: 200,
        child: ListView.builder(
          itemCount: widget.lists.length,
          itemBuilder: (context, i) {
            return ListDialogItem(listName: widget.lists[i].name,listId: widget.lists[i].id, listIdCallback: addMovieToList,);
          },
        ),
      );
    });
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
          bottom: 10,
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                MovieHubLocalizations.of(context).translate("add_movie_to_list_dialog_title"),
                style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF3e3e3e)),
              ),
            ),
            SizedBox(height: 25.0),
            listWidget,
            SizedBox(height: 20.0),
            Align(
              alignment: Alignment.bottomRight,
              child: FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(MovieHubLocalizations.of(context).translate("cancel"),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ListDialogItem extends StatelessWidget {
  Function(int) listIdCallback;
  String listName;
  int listId;

  ListDialogItem({this.listName, this.listId, this.listIdCallback});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              listIdCallback(listId);
            },
            child: Container(
              margin: EdgeInsets.all(0),
              height: 55,
              width: double.infinity,
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.local_movies,
                    color: Color(0xFF3e3e3e).withOpacity(0.6),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(listName, style: TextStyle(
                      color: Color(0xFF3e3e3e).withOpacity(0.6),
                      fontWeight: FontWeight.w400),),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 5,)
      ],
    );
  }
}
