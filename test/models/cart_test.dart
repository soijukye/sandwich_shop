import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/models/cart.dart';
import 'package:sandwich_shop/models/sandwich.dart';
import 'package:sandwich_shop/repositories/pricing_repository.dart';

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

  group('Cart', () {
    test('addItem adds a new item and groups by all parameters', () {
      final cart = Cart(pricingRepository: pricingRepository);
      final item1 = CartItem(
        id: '1',
        name: 'Veggie Delight',
        type: SandwichType.veggieDelight,
        quantity: 1,
        price: 4.99,
        isFootlong: false,
        breadType: BreadType.white,
      );
      final item2 = CartItem(
        id: '2',
        name: 'Veggie Delight',
        type: SandwichType.veggieDelight,
        quantity: 1,
        price: 7.99,
        isFootlong: true,
        breadType: BreadType.white,
      );
      cart.addItem(item1);
      cart.addItem(item2);
      expect(cart.items.length, 2);
    });

    test('addItem increases quantity for matching items', () {
      final cart = Cart(pricingRepository: pricingRepository);
      final item = CartItem(
        id: '1',
        name: 'Veggie Delight',
        type: SandwichType.veggieDelight,
        quantity: 1,
        price: 4.99,
        isFootlong: false,
        breadType: BreadType.white,
      );
      cart.addItem(item);
      cart.addItem(item);
      expect(cart.items.length, 1);
      expect(cart.items.first.quantity, 2);
    });

    test('removeItem reduces quantity or removes item', () {
      final cart = Cart(pricingRepository: pricingRepository);
      final item = CartItem(
        id: '1',
        name: 'Veggie Delight',
        type: SandwichType.veggieDelight,
        quantity: 2,
        price: 4.99,
        isFootlong: false,
        breadType: BreadType.white,
      );
      cart.addItem(item);
      final key = '${item.type.name}_${item.isFootlong}_${item.breadType.name}';
      cart.removeItem(key);
      expect(cart.items.first.quantity, 1);
      cart.removeItem(key);
      expect(cart.items.isEmpty, true);
    });

    test('clear empties the cart', () {
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
      cart.addItem(CartItem(
        id: '2',
        name: 'Chicken Teriyaki',
        type: SandwichType.chickenTeriyaki,
        quantity: 1,
        price: 5.99,
        isFootlong: false,
        breadType: BreadType.wheat,
      ));
      cart.clear();
      expect(cart.items.isEmpty, true);
    });

    test('updateQuantity updates item quantity', () {
      final cart = Cart(pricingRepository: pricingRepository);
      final item = CartItem(
        id: '1',
        name: 'Veggie Delight',
        type: SandwichType.veggieDelight,
        quantity: 1,
        price: 4.99,
        isFootlong: false,
        breadType: BreadType.white,
      );
      cart.addItem(item);
      final key = '${item.type.name}_${item.isFootlong}_${item.breadType.name}';
      cart.updateQuantity(key, 5);
      expect(cart.items.first.quantity, 5);
    });

    test('totalPrice returns correct sum', () {
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
        price: 5.99,
        isFootlong: false,
        breadType: BreadType.wheat,
      ));
      expect(cart.totalPrice, closeTo(4.99 * 2 + 5.99, 0.01));
    });
  });
}
