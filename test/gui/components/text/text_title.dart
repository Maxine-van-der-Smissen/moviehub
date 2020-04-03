import 'package:flutter_test/flutter_test.dart';
import 'package:moviehub/gui/components/text/text_title.dart';

void main() {
  test('Test if constructor gets called correctly', () {
    TextTitle text = TextTitle("Laptop1234");
    expect(text.text, "Laptop1234");
  });
}