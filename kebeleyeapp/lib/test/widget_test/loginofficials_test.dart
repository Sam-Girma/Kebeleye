import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kebeleyeapp/pages/loginofficials.dart';
import 'package:kebeleyeapp/pages/loginpage.dart';
import 'package:kebeleyeapp/pages/settings.dart';

void main() {
  Widget makeTestableWidget({required Widget child}) {
    return MaterialApp(
      home: child,
    );
  }

  testWidgets('', (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(child: LoginOfficial()));
    expect(find.text("LOGIN"), findsOneWidget);
    expect(find.text("Signup"), findsOneWidget);
    expect(find.byType(Form), findsNWidgets(0));
    expect(find.byType(TextField), findsNWidgets(4));
    expect(find.byType(TextButton), findsNWidgets(1));
    await tester.tap(find.byType(RaisedButton));

  }
  );
}