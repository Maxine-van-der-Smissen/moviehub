import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoWifiScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height - 250,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 200,
              height: 200,
              child: Image.asset("images/no_wifi.png"),
            ),
            Container(
              width: 250,
              child: Text("No internet connection found, make sure Wi-Fi or cellular data is turned on.", textAlign:TextAlign.center, style: TextStyle(

                color: Theme.of(context).brightness == Brightness.light ? Color(0xFF3E3E3E).withOpacity(0.45) : Colors.white,
              ),),
            ),
          ],
        ),
      ),
    );
  }
}