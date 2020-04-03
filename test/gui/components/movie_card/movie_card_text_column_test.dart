import 'package:flutter_test/flutter_test.dart';
import 'package:moviehub/gui/components/movie_card/movie_card_text_column.dart';

void main() {
  test('Test if constructor gets called correctly', () {
    MovieCardTextColumn listCardTextColumn = MovieCardTextColumn(movieTitle: "Test123", movieGenres: "Actie", movieRating: 1, movieReleaseDate: "12 jaar geleden",);
    expect(listCardTextColumn.movieTitle, "Test123");
    expect(listCardTextColumn.movieGenres, "Actie");
    expect(listCardTextColumn.movieRating, 1);
    expect(listCardTextColumn.movieReleaseDate, "12 jaar geleden");
  });
}