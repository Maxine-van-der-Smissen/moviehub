import 'package:flutter_test/flutter_test.dart';
import 'package:moviehub/gui/components/rating/movie_rating.dart';

void main() {
  test('Test if constructor gets called correctly', () {
    MovieRating rating = MovieRating(2.0);
    expect(rating.movieRating, 2.0);
  });
}