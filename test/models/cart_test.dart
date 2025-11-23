import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/models/cart.dart';
import 'package:sandwich_shop/models/sandwich.dart';

void main() {
  group('Cart', () {
    test('addItem adds a new item', () {
      final cart = Cart();
      final item = CartItem(
        id: '1',
        name: 'Veggie Delight',
        type: SandwichType.veggieDelight,
        quantity: 2,
        price: 4.99,
      );
      cart.addItem(item);
      expect(cart.items.length, 1);
      expect(cart.items.first.name, 'Veggie Delight');
      expect(cart.items.first.quantity, 2);
    });

    test('addItem increases quantity if item exists', () {
      final cart = Cart();
      final item = CartItem(
        id: '1',
        name: 'Veggie Delight',
        type: SandwichType.veggieDelight,
        quantity: 1,
        price: 4.99,
      );
      cart.addItem(item);
      cart.addItem(item);
      expect(cart.items.length, 1);
      expect(cart.items.first.quantity, 2);
    });

    test('removeItem removes item from cart', () {
      final cart = Cart();
      final item = CartItem(
        id: '1',
        name: 'Veggie Delight',
        type: SandwichType.veggieDelight,
        quantity: 1,
        price: 4.99,
      );
      cart.addItem(item);
      cart.removeItem('1');
      expect(cart.items.isEmpty, true);
    });

    test('clear empties the cart', () {
      final cart = Cart();
      cart.addItem(CartItem(
        id: '1',
        name: 'Veggie Delight',
        type: SandwichType.veggieDelight,
        quantity: 1,
        price: 4.99,
      ));
      cart.addItem(CartItem(
        id: '2',
        name: 'Chicken Teriyaki',
        type: SandwichType.chickenTeriyaki,
        quantity: 1,
        price: 5.99,
      ));
      cart.clear();
      expect(cart.items.isEmpty, true);
    });

    test('updateQuantity updates item quantity', () {
      final cart = Cart();
      cart.addItem(CartItem(
        id: '1',
        name: 'Veggie Delight',
        type: SandwichType.veggieDelight,
        quantity: 1,
        price: 4.99,
      ));
      cart.updateQuantity('1', 5);
      expect(cart.items.first.quantity, 5);
    });

    test('totalPrice returns correct sum', () {
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
        price: 5.99,
      ));
      expect(cart.totalPrice, closeTo(4.99 * 2 + 5.99, 0.01));
    });
  });
}
