// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_module_10/views/login_view.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Login view tests', () {
    testWidgets("Test for login form", (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: LoginView(),
      ));

      await tester.enterText(find.byKey(Key("findEmail")), 'test@test.net');
      expect(find.text('test@test.net'), findsOneWidget);

      await tester.enterText(find.byKey(Key("findPhone")), '88001001010');
      expect(find.text('88001001010'), findsOneWidget);

      await tester.tap(find.byKey(Key("logSend")));
      await tester.pump();
      expect(find.text("Welcome"), findsOneWidget);
      expect(find.text("Invalid e-mail"), findsNothing);
    });

    testWidgets("Test for registration form", (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: LoginView(),
      ));

      await tester.tap(find.byType(TextButton));
      await tester.pump();

      await tester.enterText(find.byKey(Key("firstName")), 'Ivan');
      await tester.enterText(find.byKey(Key("lastName")), 'Ivanov');
      await tester.enterText(find.byKey(Key("email")), 'test@test.net');
      await tester.enterText(find.byKey(Key("phone")), '88001001010');
      expect(find.text('88001001010'), findsOneWidget);

      await tester.tap(find.byKey(Key("regSend")));
      await tester.pump();
      expect(find.text("Enter first name"), findsNothing);
      expect(find.text("Enter last name"), findsNothing);
      expect(find.text("Registration successful"), findsWidgets);
    });
  });
}
