import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing_lab/widgets/user_registration_form.dart';

//widget testing
void main() {
  testWidgets('Displays error for invalid email', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: UserRegistrationForm()));

    await tester.enterText(find.byType(TextFormField).at(1), 'a@');
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    expect(find.text('Please enter a valid email'), findsOneWidget);
  });

  testWidgets('Displays error for weak password', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: UserRegistrationForm()));

    await tester.enterText(find.byType(TextFormField).at(2), '123');
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    expect(find.text('Password is too weak'), findsOneWidget);
  });

  testWidgets('Displays success message on valid form', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: UserRegistrationForm()));

    await tester.enterText(find.byType(TextFormField).at(0), 'John Doe');
    await tester.enterText(
      find.byType(TextFormField).at(1),
      'john@example.com',
    );
    await tester.enterText(find.byType(TextFormField).at(2), 'Abc@1234');
    await tester.enterText(find.byType(TextFormField).at(3), 'Abc@1234');

    await tester.tap(find.byType(ElevatedButton));
    await tester.pump(const Duration(seconds: 2)); // simulate delay

    expect(find.text('Registration successful!'), findsOneWidget);
  });
}
