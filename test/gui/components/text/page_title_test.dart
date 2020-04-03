import 'package:flutter_test/flutter_test.dart';
import 'package:moviehub/gui/components/text/page_title.dart';

void main() {
  test('Test if constructor gets called correctly', () {
    PageTitle text = PageTitle("GutenMorgen");
    expect(text.title, "GutenMorgen");
  });
}