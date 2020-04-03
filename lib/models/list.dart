import 'package:moviehub/models/movie.dart';

class ListCardModel {
  final int id;
  final int movieCount;
  final String name;
  final String description;

  ListCardModel(this.id, this.movieCount, this.name, this.description);
}

class ListDetailsModel {
  final int id;
  final String name;
  final String description;
  final List<MovieCardModel> items;

  ListDetailsModel(this.id, this.name, this.description, this.items);
}
