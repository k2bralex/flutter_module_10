import 'package:flutter/material.dart';
import 'package:flutter_module_10/example/other_login_view.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("Login view fields", (widgetTester) async {
    await widgetTester.pumpWidget(
      const MaterialApp(
        home: LoginView(),
      ),
    );

    expect(find.byKey(const Key("findEmail")), findsOneWidget);
    expect(find.byKey(const Key("findPhone")), findsOneWidget);
    expect(find.text("Submit"), findsOneWidget);
  });


  testWidgets("Email entering", (widgetTester) async {
    await widgetTester.pumpWidget(
      const MaterialApp(
        home: LoginView(),
      ),
    );

    await widgetTester.enterText(
        find.byKey(const Key("findEmail")), "test@test.com");

    expect(find.text("test@test.com"), findsOneWidget);
  });

  testWidgets("Phone entering", (widgetTester) async {
    await widgetTester.pumpWidget(
      const MaterialApp(
        home: LoginView(),
      ),
    );

    await widgetTester.enterText(
        find.byKey(const Key("findPhone")), "0123456789");

    expect(find.text("0123456789"), findsOneWidget);
  });

  testWidgets("Submit press", (widgetTester) async {
    await widgetTester.pumpWidget(
      const MaterialApp(
        home: LoginView(),
      ),
    );

    await widgetTester.tap(find.text('Submit'));
    await widgetTester.pump();
    expect(find.text("Logged in"), findsOneWidget);
  });
}
