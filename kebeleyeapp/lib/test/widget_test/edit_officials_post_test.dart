import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kebeleyeapp/pages/edit_officials_post.dart';

void main() {
  Widget makeTestableWidget({required Widget child}) {
    return MaterialApp(
      home: child,
    );
  }

  testWidgets('', (WidgetTester tester) async {

    await tester.pumpWidget(MaterialApp(home: editofficialpost()));
    expect(find.text("update"), findsOneWidget);
    expect(find.byType(TextField), findsNWidgets(6));
    
  }
  );
}