import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kebeleyeapp/pages/loginpage.dart';
import 'package:kebeleyeapp/pages/sent_feedback_Screen.dart';
import 'package:kebeleyeapp/pages/settings.dart';

void main() {
  Widget makeTestableWidget({required Widget child}) {
    return MaterialApp(
      home: child,
    );
  }

  testWidgets('', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home:setting(colindex: 1,)));
    // await tester.enterText(find.byType(TextFormField), 'hi');

  }
  );
}
