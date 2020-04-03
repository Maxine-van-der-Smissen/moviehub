import 'package:flutter/material.dart';
import 'package:moviehub/gui/components/movie_card/movie_card_cover.dart';
import 'package:moviehub/gui/screens/list_details/list_details.dart';
import 'package:moviehub/models/account.dart';
import 'package:moviehub/models/list.dart';
import 'package:moviehub/models/movie.dart';
import 'package:moviehub/utils/network_utils.dart';
import 'list_card_text_column.dart';

class ListCard extends StatelessWidget {
  final ListCardModel list;
  Function(int, String) listIdCallback;

  ListCard({this.list, this.listIdCallback}) : super();

  void deleteList(ListCardModel listCard) async {
    String sessionId =
        await Account.fromJson().then((account) => account.sessionId);
    if (await NetworkUtils.deleteList(listCard.id, sessionId))
      listIdCallback(listCard.id, listCard.name);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        ListDetailsModel listDetails = await NetworkUtils.fetchList(list.id);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Scaffold(
              body: ListDetails(listDetails.items, listDetails),
            ),
          ),
        );
      },
      child: Container(
        // Main Container
        margin: EdgeInsets.only(top: 22),
        height: 170,
        width: MediaQuery.of(context).size.width,
        color: Colors.transparent,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Container(
              // White Text container
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    spreadRadius: 0,
                    blurRadius: 10,
                  )
                ],
                borderRadius: BorderRadius.circular(5),
                color: Theme.of(context).backgroundColor,
              ),
              height: 150,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  margin: EdgeInsets.only(left: 125, right: 14),
                  child: Stack(
                    children: <Widget>[
                      ListCardTextColumn(
                        movieCount: list.movieCount,
                        listTitle: list.name,
                        listDescription: list.description,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          width: 35,
                          child: FlatButton(
                            padding: EdgeInsets.all(0.0),
                            child: Icon(
                              Icons.delete,
                              size: 20,
                              color: Color(0xFF3e3e3e).withOpacity(0.5),
                            ),
                            onPressed: () {
                              deleteList(list);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 12,
              top: 0,
              bottom: 12,
              child: MovieCardCover(),
            ),
          ],
        ),
      ),
    );
  }
}
