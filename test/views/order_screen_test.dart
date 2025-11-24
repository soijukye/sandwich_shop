


import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/views/order_screen.dart';

void main() {
  testWidgets('OrderScreen basic UI', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: OrderScreen(maxQuantity: 5)));

    // Check for main controls
    expect(find.text('Sandwich Type'), findsWidgets);
    expect(find.text('Bread Type'), findsWidgets);
    expect(find.text('Quantity: '), findsOneWidget);
    expect(find.text('Add to Cart'), findsOneWidget);
  });

  testWidgets('OrderScreen can increase quantity and show SnackBar', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: OrderScreen(maxQuantity: 5)));
    final plusIcon = find.byIcon(Icons.add);
    await tester.ensureVisible(plusIcon);
    await tester.tap(plusIcon);
    await tester.pump();
    expect(find.text('2'), findsOneWidget);
    await tester.tap(find.text('Add to Cart'));
    await tester.pump();
    expect(find.byType(SnackBar), findsOneWidget);
  });
}
