import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kebeleyeapp/pages/loginpage.dart';
import 'package:kebeleyeapp/pages/members_home_page.dart';
import 'package:kebeleyeapp/pages/officialshomepage.dart';
import 'package:kebeleyeapp/pages/settings.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:fast_flutter_driver/tool.dart';

void main() {
  Widget makeTestableWidget({required Widget child}) {
    return MaterialApp(
      home: child,
    );
  }

  testWidgets('', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: OfficialsHomePage()));

    expect(find.byType(ListView), findsNWidgets(1));
    expect(find.byType(BottomNavigationBar), findsNWidgets(1));
    // expect(find.byType(Icons), findsNWidgets(4));
      // await driver.waitFor(find.byValueKey('bottom'));

    // await tester.enterText(find.byType(TextField), 'hi_there');
    // expect(find.text("hi_there"), findsOneWidget);
    // expect(find.byType(GestureDetector), findsNWidgets(9));
    // await tester.tap(find.byKey(testkey));
    

  }
  );
}