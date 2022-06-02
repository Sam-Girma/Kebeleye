import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kebeleyeapp/pages/loginpage.dart';
import 'package:kebeleyeapp/pages/tosee_tosend_toreportpage.dart';

void main() {
  Widget makeTestableWidget({required Widget child}) {
    return MaterialApp(
      home: child,
    );
  }

  testWidgets('', (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(child:PostPage(name: name, position: position, imageurl: imageurl) ));
    // await tester.enterText(find.byType(TextFormField), 'hi');

  }
  );
}