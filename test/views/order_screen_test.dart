import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/views/order_screen.dart';
import 'package:sandwich_shop/models/sandwich.dart';

void main() {
  testWidgets('OrderScreen displays controls and adds to cart', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: OrderScreen(maxQuantity: 5)));

    // Check for sandwich type dropdown
    expect(find.text('Sandwich Type'), findsWidgets);
    // Check for bread type dropdown
    expect(find.text('Bread Type'), findsWidgets);
    // Check for quantity controls
    expect(find.text('Quantity: '), findsOneWidget);
    // Check for Add to Cart button
    expect(find.text('Add to Cart'), findsOneWidget);

    // Select sandwich type
    await tester.tap(find.byType(DropdownMenu<SandwichType>));
    await tester.pumpAndSettle();
    expect(find.text('Chicken Teriyaki'), findsWidgets);
    await tester.tap(find.text('Chicken Teriyaki').first);
    await tester.pumpAndSettle();

    // Select bread type
    await tester.tap(find.byType(DropdownMenu<BreadType>));
    await tester.pumpAndSettle();
    expect(find.text('wheat'), findsWidgets);
    await tester.tap(find.text('wheat').first);
    await tester.pumpAndSettle();

    // Increase quantity
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    expect(find.text('2'), findsOneWidget);

    // Add to cart
    await tester.tap(find.text('Add to Cart'));
    await tester.pump();
    // SnackBar should appear
    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.textContaining('Added 2 footlong Chicken Teriyaki sandwich(es) on wheat bread to cart'), findsOneWidget);
  });
}
