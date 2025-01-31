// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_project/main.dart';

void main() {
  group('HomePage Widget Tests', () {
    testWidgets('Should display correct title', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: HomePage(title: 'Mobile App'),
      ));
      expect(find.text('Mobile App'), findsOneWidget);
    });

    testWidgets('Should display all buttons', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: HomePage(title: 'Mobile App'),
      ));
      
      expect(find.text('GitHub Repository'), findsOneWidget);
      expect(find.text('Mobile Developers'), findsOneWidget);
      expect(find.text('Telex'), findsOneWidget);
      expect(find.text('Delve'), findsOneWidget);
    });
  });
}
