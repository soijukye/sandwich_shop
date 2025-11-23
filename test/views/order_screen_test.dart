import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/models/sandwich.dart';
import 'package:sandwich_shop/views/order_screen.dart';

void main() {
  group('OrderScreen', () {
    testWidgets('shows initial UI elements', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: OrderScreen(maxQuantity: 5)));
      expect(find.text('Sandwich Shop'), findsOneWidget);
      expect(find.text('Add to Cart'), findsOneWidget);
      expect(find.byType(DropdownMenu<SandwichType>), findsOneWidget);
      expect(find.byType(DropdownMenu<BreadType>), findsOneWidget);
      expect(find.byType(Switch), findsOneWidget);
      expect(find.byType(IconButton), findsNWidgets(2)); // Add/Remove quantity
    });

    testWidgets('increments and decrements quantity', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: OrderScreen(maxQuantity: 5)));
      expect(find.text('1'), findsOneWidget); // initial quantity
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();
      expect(find.text('2'), findsOneWidget);
      await tester.tap(find.byIcon(Icons.remove));
      await tester.pump();
      expect(find.text('1'), findsOneWidget);
    });

    testWidgets('shows SnackBar when item is added to cart', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: OrderScreen(maxQuantity: 5)));
      await tester.tap(find.text('Add to Cart'));
      await tester.pump(); // Start animation
      await tester.pump(const Duration(seconds: 2)); // Wait for SnackBar
      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.textContaining('Added'), findsOneWidget);
    });
  });
}
