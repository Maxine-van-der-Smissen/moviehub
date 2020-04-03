import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviehub/utils/localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FilterDialog extends StatefulWidget {

  VoidCallback onSortChange;

  FilterDialog({this.onSortChange});

  @override
  _FilterDialogState createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  double rating = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadFilter();
  }

  void loadFilter() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.getStringList("filters") == null) preferences.setStringList("filters", ["vote_average.gte=5"]);
    List<String> appliedFilters = preferences.getStringList("filters");
    print(appliedFilters);
    setState(() {
      appliedFilters.forEach((filter) {
        if (filter.startsWith("vote_average")) rating = double.parse(filter.split("=")[1]).round() * 0.5;
      });
    });
  }

  void saveFilter() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setStringList("filters", ["vote_average.gte=${rating * 2}"]);
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
                MovieHubLocalizations.of(context).translate("filter_dialog_title"),
                style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF3e3e3e)),
              ),
            ),
            SizedBox(height: 16.0),
            Text("${MovieHubLocalizations.of(context).translate("filter_dialog_min_rating_header")}: ${rating.toString()}"),
            Slider(
              value: rating,
              min: 0,
              max: 5,
              activeColor: Colors.red,
              inactiveColor: Colors.red,
              onChanged: (newValue) {
                setState(() {
                  rating = newValue;
                });
              },
              divisions: 10,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: FlatButton(
                onPressed: () {
                  saveFilter();
                  Navigator.of(context).pop();
                },
                child: Text(MovieHubLocalizations.of(context).translate("done")),
              ),
            ),
          ],
        ),
      ),
    );
  }
}