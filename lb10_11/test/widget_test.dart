import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:lb10/main.dart';
import 'package:lb10/pages/TestWidget.dart';

/*
void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}*/

void main() {

  testWidgets('Simple test for widget', (WidgetTester tester) async {
    await tester.pumpWidget(TestWidget());
    await tester.pumpAndSettle();

    const textFieldKey = Key("textField");

    await tester.enterText(find.byKey(textFieldKey), 'test-text');

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump();
    expect(find.text('test-text'), findsOneWidget);

    await tester.drag(find.byType(Dismissible), Offset(500.0, 0.0));
    await tester.pumpAndSettle();
    expect(find.text('test-text'), findsNothing);

  });
}