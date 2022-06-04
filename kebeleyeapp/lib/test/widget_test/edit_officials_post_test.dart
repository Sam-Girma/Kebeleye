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
    const testkey = Key("a");
    const testkey2 = Key("b");
    const testkey3 = Key("c");
    const testkey4 = Key("d");
    const testkey5 = Key("e");

    await tester.pumpWidget(MaterialApp(home: editofficialpost()));
    expect(find.text("update"), findsOneWidget);
    expect(find.byType(TextField), findsNWidgets(6));
    expect(find.byKey(testkey), findsNWidgets(1));

    await tester.enterText(find.byKey(testkey), 'hi_there');
    expect(find.text("hi_there"), findsOneWidget);

    expect(find.byKey(testkey2), findsNWidgets(1));
    await tester.enterText(find.byKey(testkey2), 'hi_there');
    expect(find.text("hi_there"), findsNWidgets(2));

    expect(find.byKey(testkey3), findsNWidgets(1));
    await tester.enterText(find.byKey(testkey3), 'hi_there');
    expect(find.text("hi_there"), findsNWidgets(3));
  });
}
