import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing_lab/widgets/shopping_cart.dart';

void main() {
  testWidgets('ShoppingCart displays and updates items correctly', (
    WidgetTester tester,
  ) async {
    // بناء الواجهة
    await tester.pumpWidget(
      const MaterialApp(home: Scaffold(body: ShoppingCart())),
    );

    // تأكد إن السلة فاضية في البداية
    expect(find.text('Cart is empty'), findsOneWidget);

    // اضغط زر إضافة iPhone
    await tester.tap(find.text('Add iPhone'));
    await tester.pump();

    // تأكد إن العنصر ظهر
    expect(find.text('Apple iPhone'), findsOneWidget);
    expect(find.text('1'), findsOneWidget); // الكمية

    // اضغط زر إضافة iPhone مرة تانية
    await tester.tap(find.text('Add iPhone Again'));
    await tester.pump();

    // تأكد إن الكمية بقت 2
    expect(find.text('2'), findsOneWidget);

    // اضغط زر حذف العنصر
    await tester.tap(find.byIcon(Icons.delete));
    await tester.pump();

    // تأكد إن السلة فاضية تاني
    expect(find.text('Cart is empty'), findsOneWidget);
  });
}
