import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../presentation/posts_list/sent_report_screen.dart';

void main() {
  Widget makeTestableWidget({required Widget child}) {
    return MaterialApp(
      home: child,
    );
  }

  testWidgets('', (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(child: SentReportScreen()));
    // await tester.enterText(find.byType(TextFormField), 'hi');
  });
}
