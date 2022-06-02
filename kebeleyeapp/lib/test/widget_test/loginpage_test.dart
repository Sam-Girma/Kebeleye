import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kebeleyeapp/main.dart';
import 'package:kebeleyeapp/pages/loginofficials.dart';
import 'package:kebeleyeapp/pages/loginpage.dart';

void main() {
  Widget makeTestableWidget({required Widget child}) {
    return MaterialApp(
      home: child,
    );
  }

  testWidgets('', (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(child: LoginPage()));
    // expect(find.byType(Form), findsOneWidget);
    // await tester.enterText(find.byType(TextFormField), 'hi');

    // expect(state.methodToBeTested(), 0);
  });
}
