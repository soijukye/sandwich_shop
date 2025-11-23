import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/models/cart.dart';
import 'package:sandwich_shop/models/sandwich.dart';
import 'package:sandwich_shop/views/cart_screen.dart'; // Assuming CartScreen is in main.dart

void main() {
  group('CartScreen', () {
    testWidgets('shows empty message when cart is empty', (WidgetTester tester) async {
      final cart = Cart();
      await tester.pumpWidget(
        MaterialApp(
          home: CartScreen(cart: cart),
        ),
      );
      expect(find.text('Your cart is empty.'), findsOneWidget);
    });

    testWidgets('shows cart items when cart is not empty', (WidgetTester tester) async {
      final cart = Cart();
      cart.addItem(CartItem(
        id: '1',
        name: 'Veggie Delight',
        type: SandwichType.veggieDelight,
        quantity: 2,
        price: 4.99,
      ));
      cart.addItem(CartItem(
        id: '2',
        name: 'Chicken Teriyaki',
        type: SandwichType.chickenTeriyaki,
        quantity: 1,
        price: 8.99,
      ));

      await tester.pumpWidget(
        MaterialApp(
          home: CartScreen(cart: cart),
        ),
      );

      expect(find.text('Veggie Delight'), findsOneWidget);
      expect(find.text('Chicken Teriyaki'), findsOneWidget);
      expect(find.text('Quantity: 2'), findsOneWidget);
      expect(find.text('Quantity: 1'), findsOneWidget);
      expect(find.text('Total: £9.98'), findsOneWidget);
      expect(find.text('Total: £8.99'), findsOneWidget);
    });
  });
}
