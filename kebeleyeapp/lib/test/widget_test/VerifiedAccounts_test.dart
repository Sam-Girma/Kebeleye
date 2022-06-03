import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kebeleyeapp/pages/Admin%20Pages/VerifiedAccounts.dart';
import 'package:kebeleyeapp/pages/loginpage.dart';

void main() {
  Widget makeTestableWidget({required Widget child}) {
    return MaterialApp(
      home: child,
    );
  }

  testWidgets('', (WidgetTester tester) async {
    const testkey = Key("button_1");
    const testkey2 = Key("button_2");

    await tester.pumpWidget(MaterialApp(key:testkey,home: VerifiedAccounts()));
    expect(find.byType(AppBar), findsNWidgets(1));
    final ScaffoldState state = tester.firstState(find.byType(Scaffold));
    state.openDrawer();
    await tester.pump();
    expect(find.byType(ListView), findsNWidgets(2));
    expect(find.byType(ListView), findsNWidgets(2));
    expect(find.byKey(testkey), findsNWidgets(1));
    await tester.tap(find.byKey(testkey));
    await tester.pumpWidget(MaterialApp(key:testkey2,home: VerifiedAccounts()));
    await tester.tap(find.byKey(testkey2));

  }
  );
}
