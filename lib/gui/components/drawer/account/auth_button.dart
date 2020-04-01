import 'package:flutter/cupertino.dart';
import 'package:moviehub/gui/components/drawer/list_item.dart';
import 'package:moviehub/models/account.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthButton extends StatefulWidget {
  VoidCallback onChange;
  VoidCallback login;
  VoidCallback logout;

  AuthButton({this.onChange, this.login, this.logout});

  @override
  _AuthButtonState createState() => _AuthButtonState();
}

class _AuthButtonState extends State<AuthButton> {
  Widget buttonWidget = Container();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadButton();
  }

  void loadButton() async {
    Account account = await Account.fromJson();
    setState(() {
      if (account == null) {
        buttonWidget = ListItem(
          title: "login",
          content: ListItemContent.LOGIN,
          onTap: () => widget.login(),
        );
      } else {
        buttonWidget = ListItem(
          title: "logout",
          content: ListItemContent.LOGOUT,
          onTap: () => widget.logout(),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return buttonWidget;
  }
}
