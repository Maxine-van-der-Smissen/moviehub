import 'package:flutter_test/flutter_test.dart';
import 'package:moviehub/gui/components/app_bar/list_detail_app_bar.dart';

void main() {
  test('Preferredsize height should return 64', () {
    ListDetailAppBar appBar = ListDetailAppBar();
    expect(appBar.preferredSize.height, 64);
  });
}