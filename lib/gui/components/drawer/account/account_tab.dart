import 'package:flutter/cupertino.dart';
import 'package:moviehub/gui/components/drawer/account/profile_image.dart';

class AccountTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 150,
      color: Color(0xFFF9E7C3),
      child: Container(
        margin: EdgeInsets.only(top: 18, left: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ProfileImage(),
            Container(
              margin: EdgeInsets.only(top: 14, bottom: 5),
              child: Text(
                "Kyllian Warmerdam",
                style: TextStyle(
                  color: Color(0xFF3E3E3E),
                  fontSize: 16,
                  fontWeight: FontWeight.w500
                ),
              ),
            ),
            Text(
              "kyllian007@gmail.com",
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
