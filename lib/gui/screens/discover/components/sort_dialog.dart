import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SortDialog extends StatefulWidget {
  @override
  _SortDialogState createState() => _SortDialogState();

  VoidCallback onSortChange;

  SortDialog({this.onSortChange});

}

class _SortDialogState extends State<SortDialog> {

  String sortName;
  String sortPosition;

  List<String> sorts = ['popularity', 'release_date', 'revenue', 'primary_release_date', 'vote_average', 'vote_count'].toList();
  List<String> ways = ['ascending', 'descending'].toList();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadSort();
  }

  void loadSort() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.getString("sort") == null) preferences.setString("sort", "original_title.desc");
    String currentSort = preferences.getString("sort");
    List<String> split = currentSort.split(".");
    setState(() {
      sortName = split[0];
      sortPosition = split[1] == "asc" ? "ascending" : "descending";
    });
  }

  void saveSort() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String sortString = sortName;
    sortString += sortPosition == "ascending" ? ".asc" : ".desc";
    preferences.setString("sort", sortString);
    widget.onSortChange();
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
                "Sort",
                style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF3e3e3e)),
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              children: <Widget>[
                DropdownButton<String>(
                  value: sortName,
                  icon: Icon(Icons.arrow_drop_down),
                  onChanged: (String newValue) {
                    setState(() {
                      sortName = newValue;
                    });
                  },
                  items: sorts
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                Spacer(),
                DropdownButton<String>(
                  value: sortPosition,
                  icon: Icon(Icons.arrow_drop_down),
                  onChanged: (String newValue) {
                    setState(() {
                      sortPosition = newValue;
                    });
                  },
                  items: ways
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: FlatButton(
                onPressed: () {
                  saveSort();
                  Navigator.of(context).pop();
                },
                child: Text("Done"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
