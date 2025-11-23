import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/models/cart.dart';
import 'package:sandwich_shop/models/sandwich.dart';
import 'package:sandwich_shop/repositories/pricing_repository.dart';
import 'package:sandwich_shop/views/cart_screen.dart';

void main() {
  final pricingRepository = PricingRepository(
    sixInchPrices: {
      SandwichType.veggieDelight: 4.99,
      SandwichType.chickenTeriyaki: 5.99,
    },
    footlongPrices: {
      SandwichType.veggieDelight: 7.99,
      SandwichType.chickenTeriyaki: 8.99,
    },
  );

  testWidgets('CartScreen displays items and total price', (WidgetTester tester) async {
    final cart = Cart(pricingRepository: pricingRepository);
    cart.addItem(CartItem(
      id: '1',
      name: 'Veggie Delight',
      type: SandwichType.veggieDelight,
      quantity: 2,
      price: 4.99,
      isFootlong: false,
      breadType: BreadType.white,
    ));
    cart.addItem(CartItem(
      id: '2',
      name: 'Chicken Teriyaki',
      type: SandwichType.chickenTeriyaki,
      quantity: 1,
      price: 8.99,
      isFootlong: true,
      breadType: BreadType.wheat,
    ));

    await tester.pumpWidget(MaterialApp(home: CartScreen(cart: cart)));

    expect(find.text('Veggie Delight'), findsOneWidget);
    expect(find.text('Chicken Teriyaki'), findsOneWidget);
    expect(find.text('Size: Six-inch'), findsOneWidget);
    expect(find.text('Size: Footlong'), findsOneWidget);
    expect(find.text('Bread: white'), findsOneWidget);
    expect(find.text('Bread: wheat'), findsOneWidget);
    expect(find.text('Quantity: 2'), findsOneWidget);
    expect(find.text('Quantity: 1'), findsOneWidget);
    expect(find.text('Total: £9.98'), findsOneWidget); // 4.99 * 2
    expect(find.text('Total: £8.99'), findsOneWidget); // 8.99 * 1
    expect(find.text('Total Price: £18.97'), findsOneWidget); // 9.98 + 8.99
  });

  testWidgets('CartScreen shows empty message when cart is cleared', (WidgetTester tester) async {
    final cart = Cart(pricingRepository: pricingRepository);
    cart.addItem(CartItem(
      id: '1',
      name: 'Veggie Delight',
      type: SandwichType.veggieDelight,
      quantity: 1,
      price: 4.99,
      isFootlong: false,
      breadType: BreadType.white,
    ));

    await tester.pumpWidget(MaterialApp(home: CartScreen(cart: cart)));
    expect(find.text('Veggie Delight'), findsOneWidget);

    // Tap the 'Empty Cart' button in the AppBar
    await tester.tap(find.byTooltip('Empty Cart'));
    await tester.pump();
    expect(find.text('Your cart is empty.'), findsOneWidget);
  });
}
