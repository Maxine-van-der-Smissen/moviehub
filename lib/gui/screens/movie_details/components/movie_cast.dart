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
        Container(
          width: double.infinity,
          height: 100,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: castMembers.length,
              itemBuilder: (context, i) {
                return Row(
                  children: <Widget>[
                    MovieCastMember(
                      url: castMembers[i].profileImage,
                      castMemberName: castMembers[i].name,
                    ),
                    SizedBox(width: 10),
                  ],
                );
              }),
        )
      ],
    );
  }
}

class MovieCastMember extends StatelessWidget {
  String castMemberName;
  String url;

  MovieCastMember({this.castMemberName, this.url});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ProfileImage(
          url: this.url,
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          castMemberName,
          style: TextStyle(color: Color(0xFF000000).withOpacity(0.3),
          fontSize: 12),
        )
      ],
    );
  }
}
