import 'package:flutter_test/flutter_test.dart';
import 'package:moviehub/gui/components/list_card/list_card_text_column.dart';

void main() {
  test('Test if constructor gets called correctly', () {
    ListCardTextColumn listCardTextColumn = ListCardTextColumn(listDescription: "Test123", listTitle: "TitleTest", movieCount: 2,);
    expect(listCardTextColumn.listTitle, "TitleTest");
    expect(listCardTextColumn.listDescription, "Test123");
    expect(listCardTextColumn.movieCount, 2);
  });
}