import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_driver/driver_extension.dart';
import 'package:fast_flutter_driver/tool.dart';

import '../../presentation/core/officialshomepage.dart';

void main() {
  Widget makeTestableWidget({required Widget child}) {
    return MaterialApp(
      home: child,
    );
  }

  testWidgets('', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: OfficialsHomePage()));

    // expect(find.byType(ListView), findsNWidgets(2));

    // await tester.enterText(find.byType(TextField), 'hi_there');
    // expect(find.text("hi_there"), findsOneWidget);
    // expect(find.byType(GestureDetector), findsNWidgets(9));
    // await tester.tap(find.byKey(testkey));
  });
}
