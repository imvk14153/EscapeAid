import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:escapeaid/main.dart';

void main() {
  testWidgets('App should build without crashing', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    expect(find.text('EscapeAid'), findsOneWidget);
  });
}
