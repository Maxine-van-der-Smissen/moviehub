import 'package:flutter/cupertino.dart';
import 'package:moviehub/gui/components/drawer/list_item.dart';
import 'package:moviehub/models/account.dart';
import 'package:moviehub/utils/localizations.dart';

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
          title: MovieHubLocalizations.of(context).translate("login"),
          content: ListItemContent.LOGIN,
          onTap: () => widget.login(),
        );
      } else {
        buttonWidget = ListItem(
          title: MovieHubLocalizations.of(context).translate("logout"),
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
