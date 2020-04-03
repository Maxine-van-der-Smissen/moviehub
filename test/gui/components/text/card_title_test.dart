import 'package:flutter_test/flutter_test.dart';
import 'package:moviehub/gui/components/text/card_title.dart';

void main() {
  test('Test if constructor gets called correctly', () {
    CardTitle text = CardTitle("Hello World");
    expect(text.title, "Hello World");
  });
}