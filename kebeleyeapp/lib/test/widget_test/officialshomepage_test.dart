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


  testWidgets('', (WidgetTester tester) async {
    const testkey = Key("a");
    const testkey2 = Key("b");
    const testkey3 = Key("c");
    const testkey4 = Key("d");
    const testkey5 = Key("e");
    const testkey6 = Key("f");
    await tester.pumpWidget(MaterialApp(home: OfficialsHomePage()));

    expect(find.byType(ListView), findsNWidgets(1));
    expect(find.byType(BottomNavigationBar), findsNWidgets(1));
    expect(find.byType(TextFormField), findsNWidgets(6));
    expect(find.byKey(testkey), findsNWidgets(1));
    await tester.enterText(find.byKey(testkey), 'hi_there');
    expect(find.text("hi_there"), findsOneWidget);


    expect(find.byKey(testkey2), findsNWidgets(1));
    await tester.enterText(find.byKey(testkey2), 'hi_there');
    expect(find.text("hi_there"), findsNWidgets(2));


    expect(find.byKey(testkey3), findsNWidgets(1));
    await tester.enterText(find.byKey(testkey3), 'hi_there');
    expect(find.text("hi_there"), findsNWidgets(3));


    // expect(find.byType(Icons), findsNWidgets(4));
      // await driver.waitFor(find.byValueKey('bottom'));

    // await tester.enterText(find.byType(TextField), 'hi_there');
    // expect(find.text("hi_there"), findsOneWidget);
    // expect(find.byType(GestureDetector), findsNWidgets(9));
    // await tester.tap(find.byKey(testkey));
    

  }
  );
}