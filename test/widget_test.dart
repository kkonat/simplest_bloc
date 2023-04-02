// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:simplest_bloc/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const App());

    // Verify that our counter starts at 0.
    expect(find.text('The state is now: 0'), findsOneWidget);
    expect(find.text('The state is now: 1'), findsNothing);

    await tester.tap(find.byIcon(Icons.remove));
    await tester.pump();
    expect(find.text('The state is now: -1'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.clear));
    await tester.pump();
    expect(find.text('The state is now: 0'), findsOneWidget);
    expect(find.text('The state is now: 1'), findsNothing);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    expect(find.text('The state is now: 0'), findsNothing);
    expect(find.text('The state is now: 1'), findsOneWidget);
  });
}
