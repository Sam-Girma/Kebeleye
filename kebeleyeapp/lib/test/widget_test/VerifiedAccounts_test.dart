import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../presentation/auth/loginpage.dart';

void main() {
  Widget makeTestableWidget({required Widget child}) {
    return MaterialApp(
      home: child,
    );
  }

  testWidgets('', (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(child: LoginPage()));
    // await tester.enterText(find.byType(TextFormField), 'hi');
  });
}
