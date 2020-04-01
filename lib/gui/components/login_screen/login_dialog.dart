import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviehub/utils/network_utils.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LoginDialog extends StatefulWidget {

  @override
  _LoginDialogState createState() => _LoginDialogState();
}

class _LoginDialogState extends State<LoginDialog> {
  final Completer<WebViewController> completer = Completer<WebViewController>();
  WebViewController controller;

  Widget baseWidget = Container();

  String url = "https://www.google.nl";

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    updateURL();
  }

  void updateURL() async {
    String url = await NetworkUtils.fetchRequestURL();
    print(url);
    setState(() {
      baseWidget = Container(
        width: double.infinity,
        height: 500,
        child: WebView (
          initialUrl: url,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            completer.complete(webViewController);
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
                "Login",
                style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF3e3e3e)),
              ),
            ),
            SizedBox(height: 16.0),
            baseWidget,
            Align(
              alignment: Alignment.bottomRight,
              child: FlatButton(
                onPressed: () {
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