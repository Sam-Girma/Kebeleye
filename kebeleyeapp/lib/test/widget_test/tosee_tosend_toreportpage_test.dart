import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget makeTestableWidget({required Widget child}) {
    return MaterialApp(
      home: child,
    );
  }

  testWidgets('', (WidgetTester tester) async {
    // await tester.pumpWidget(makeTestableWidget(child:PostPage(name: name, position: position, imageurl: imageurl) ));
    // await tester.enterText(find.byType(TextFormField), 'hi');
  });
}
