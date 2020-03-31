import 'package:flutter/cupertino.dart';
import 'package:moviehub/gui/components/drawer/account/profile_image.dart';
import 'package:moviehub/gui/components/text/text_title.dart';
import 'package:moviehub/models/cast_member.dart';

// ignore: must_be_immutable
class MovieCast extends StatelessWidget {
  List<CastMember> castMembers;

  MovieCast(movieCast) : this.castMembers = movieCast;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextTitle("Cast"),
        SizedBox(
          height: 10,
        ),
        // TODO ADD HORIZONTAL SCROLL CAST MEMBERS
        MovieCastMember("Peter")
      ],
    );
  }
}

class MovieCastMember extends StatelessWidget {
  String castMemberName;

  MovieCastMember(memberName) : this.castMemberName = memberName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ProfileImage(),
        SizedBox(
          height: 5,
        ),
        Text(
          castMemberName,
          style: TextStyle(color: Color(0xFF000000).withOpacity(0.3)),
        )
      ],
    );
  }
}
