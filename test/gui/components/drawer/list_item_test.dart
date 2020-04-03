import 'package:flutter_test/flutter_test.dart';
import 'package:moviehub/gui/components/drawer/list_item.dart';

void main() {
  test('Test if widget gets constructed correctly', () {
    ListItem listItem = ListItem(title: "", content: ListItemContent.NIGHT_MODE, onTap: () => null,);
    expect(listItem.content, ListItemContent.NIGHT_MODE);
    expect(listItem.title, '');
  });
}