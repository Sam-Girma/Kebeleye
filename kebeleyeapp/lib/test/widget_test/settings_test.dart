import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kebeleyeapp/pages/loginpage.dart';
import 'package:kebeleyeapp/pages/settings.dart';

void main() {


  testWidgets('', (WidgetTester tester) async {
    const testkey = Key("test_fied_1");
    const testkey2 = Key("test_fied_2");
    await tester.pumpWidget(MaterialApp(key:testkey,home:setting(colindex: 1)));
    expect(find.byKey(testkey), findsNWidgets(2));
    // await tester.enterText(find.byType(TextField), 'hi_there');
    // expect(find.text("hi_there"), findsOneWidget);

  }
  );
}