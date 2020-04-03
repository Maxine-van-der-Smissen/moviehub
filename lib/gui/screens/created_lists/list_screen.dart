import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviehub/gui/components/list_card/list_card.dart';
import 'package:moviehub/gui/components/text/page_title.dart';
import 'package:moviehub/gui/screens/created_lists/components/list_creation_dialog.dart';
import 'package:moviehub/models/account.dart';
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

  void displayLists() async{

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

  Widget button = Container();

  void loadLists() async {
    if (await Account.fromJson() == null) {
      setState(() {
        listWidget = Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height - 250,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 200,
                  height: 200,
                  child: Image.asset("images/no_auth.png"),
                ),
                Text("To view and create lists, you need to be authenticated", style: TextStyle(
                  color: Theme.of(context).brightness == Brightness.light ? Color(0xFF3E3E3E).withOpacity(0.45) : Colors.white,
                ),),
              ],
            ),
          ),
        );
      });
      return;
    }
    setState(() {
      button = Container(
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
      );
    });
    lists = await NetworkUtils.fetchLists();
    displayLists(); 
  }

  void deleteList(int id, String listName) {
    lists.removeWhere((listCard) => listCard.id == id);
    displayLists();
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text('Deleted list: "$listName"'),
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
        floatingActionButton: button,
      ),
    );
  }
}
