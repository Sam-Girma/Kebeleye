import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kebeleyeapp/pages/loginpage.dart';

void main() {
  Widget makeTestableWidget({required Widget child}) {
    return MaterialApp(
      home: child,
    );
  }

  testWidgets('', (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(child: LoginPage()));
    // var textfield = find.byType(Stack);
    // expect(textfield, findsOneWidget);
  }
  );
}
