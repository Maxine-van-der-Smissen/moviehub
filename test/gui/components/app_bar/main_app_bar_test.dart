

import 'package:flutter_test/flutter_test.dart';
import 'package:moviehub/gui/components/app_bar/main_app_bar.dart';

void main() {
  test('Preferredsize height should return 64', () {
    MainAppBar appBar = MainAppBar();
    expect(appBar.preferredSize.height, 64);
  });
}