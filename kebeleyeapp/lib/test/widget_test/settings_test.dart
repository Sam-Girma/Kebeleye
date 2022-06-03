import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kebeleyeapp/pages/loginpage.dart';
import 'package:kebeleyeapp/pages/settings.dart';

void main() {


  testWidgets('', (WidgetTester tester) async {
    const testkey = Key("test_fied_1");
    const testkey2 = Key("test_fied_2");
    await tester.pumpWidget(MaterialApp(home:setting(colindex: 1)));
    expect(find.byKey(testkey), findsNWidgets(1));
    await tester.enterText(find.byKey(testkey), 'hi_there');
    expect(find.text("hi_there"), findsOneWidget);
    await tester.enterText(find.byKey(testkey2), 'hi_there');
    expect(find.text("hi_there"), findsNWidgets(2));
    
  }
  );
}