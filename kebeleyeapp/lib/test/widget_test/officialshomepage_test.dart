import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kebeleyeapp/pages/loginofficials.dart';
import 'package:kebeleyeapp/pages/loginpage.dart';
import 'package:kebeleyeapp/pages/officialshomepage.dart';
import 'package:kebeleyeapp/pages/settings.dart';

void main() {
  Widget makeTestableWidget({required Widget child}) {
    return MaterialApp(
      home: child,
    );
  }

  testWidgets('', (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(child: OfficialsHomePage()));

    // expect(find.text("announcments"), findsOneWidget);
    // expect(find.byType(TextFormField), findsNWidgets(3));

  });
}
