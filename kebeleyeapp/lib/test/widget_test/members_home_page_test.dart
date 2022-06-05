import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:fast_flutter_driver/tool.dart';

import '../../presentation/core/members_home_page.dart';

void main() {
  Widget makeTestableWidget({required Widget child}) {
    return MaterialApp(
      home: child,
    );
  }

  testWidgets('', (WidgetTester tester) async {
    const testkey = Key("Gesture_detector_1");

    await tester.pumpWidget(MaterialApp(key: testkey, home: MembersHomePage()));

    expect(find.byKey(testkey), findsOneWidget);

    expect(find.byType(TextField), findsNWidgets(1));
    await tester.enterText(find.byType(TextField), 'hi_there');
    expect(find.text("hi_there"), findsOneWidget);
    expect(find.byType(GestureDetector), findsNWidgets(9));
    await tester.tap(find.byKey(testkey));
  });
}
