import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviehub/gui/components/list_card/list_card.dart';
import 'package:moviehub/gui/components/text/page_title.dart';
import 'package:moviehub/gui/screens/created_lists/components/list_creation_dialog.dart';
import 'package:moviehub/models/list.dart';
import 'package:moviehub/utils/network_utils.dart';

// ignore: must_be_immutable
class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  Widget listWidget = Container();

  List<ListCardModel> lists;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadLists();
  }

  void addList(ListCardModel newListCard) {
    lists.insert(0, newListCard);
    displayLists();
  }

  void displayLists() {
    setState(() {
      listWidget = Container(
        width: 1000,
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          itemCount: lists.length,
          itemBuilder: (context, i) {
            return ListCard(
              list: lists[i],
              listIdCallback: deleteList,
            );
          },
        ),
      );
    });
  }

  void loadLists() async {
    lists = await NetworkUtils.fetchLists();
    displayLists(); 
  }

  void deleteList(int id, String name) {
    lists.removeWhere((listCard) => listCard.id == id);
    displayLists();
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text('Deleted list: "$name"'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: Container(
                  margin: EdgeInsets.only(top: 15,left: 15, right: 15),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: PageTitle("Created lists"),
                  ),
                ),
              ),
              listWidget,
            ],
          ),
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
                builder: (BuildContext context) => ListCreationDialog(
                  callback: addList,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
