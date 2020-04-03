import 'package:flutter/cupertino.dart';
import 'package:moviehub/gui/components/drawer/account/profile_image.dart';
import 'package:moviehub/models/account.dart';

class AccountTab extends StatefulWidget {

  @override
  _AccountTabState createState() => _AccountTabState();
}

class _AccountTabState extends State<AccountTab> {

  String name = "...";
  String id = "...";
  String profileImage;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadData();
  }

  void loadData() async {
    Account account = await Account.fromJson();
    if (account == null) return;
    setState(() {
      name = account.username;
      id = account.accountId.toString();
      profileImage = account.profileURL;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 150,
      color: Color(0xFFF9E7C3),
      child: Container(
        margin: EdgeInsets.only(top: 22, left: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ProfileImage(url: profileImage),
            Container(
              margin: EdgeInsets.only(top: 14, bottom: 5),
              child: Text(
                name,
                style: TextStyle(
                  color: Color(0xFF3E3E3E),
                  fontSize: 16,
                  fontWeight: FontWeight.w500
                ),
              ),
            ),
            Text(
              id,
              style: TextStyle(
                color: Color(0xFF333333),
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
