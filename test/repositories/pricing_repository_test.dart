import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/repositories/pricing_repository.dart';
import 'package:sandwich_shop/models/sandwich.dart';
import 'package:sandwich_shop/models/cart.dart';

void main() {
  group('PricingRepository', () {
    final pricingRepository = PricingRepository(
      sixInchPrices: {
        SandwichType.veggieDelight: 4.99,
        SandwichType.chickenTeriyaki: 5.99,
        SandwichType.tunaMelt: 5.49,
        SandwichType.meatballMarinara: 5.79,
      },
      footlongPrices: {
        SandwichType.veggieDelight: 7.99,
        SandwichType.chickenTeriyaki: 8.99,
        SandwichType.tunaMelt: 8.49,
        SandwichType.meatballMarinara: 8.79,
      },
    );

    test('getSandwichPrice returns correct price for six-inch', () {
      expect(pricingRepository.getSandwichPrice(SandwichType.veggieDelight, false), 4.99);
      expect(pricingRepository.getSandwichPrice(SandwichType.chickenTeriyaki, false), 5.99);
    });

    test('getSandwichPrice returns correct price for footlong', () {
      expect(pricingRepository.getSandwichPrice(SandwichType.veggieDelight, true), 7.99);
      expect(pricingRepository.getSandwichPrice(SandwichType.chickenTeriyaki, true), 8.99);
    });

    test('calculateSubtotal returns correct value', () {
      expect(pricingRepository.calculateSubtotal(2, SandwichType.tunaMelt, false), closeTo(5.49 * 2, 0.01));
      expect(pricingRepository.calculateSubtotal(3, SandwichType.meatballMarinara, true), closeTo(8.79 * 3, 0.01));
    });

    test('calculateCartSubtotal returns correct total', () {
      final cart = Cart(pricingRepository: pricingRepository);
      cart.addItem(CartItem(
        id: '1',
        name: 'Veggie Delight',
        type: SandwichType.veggieDelight,
        quantity: 2,
        price: 4.99,
        isFootlong: false,
      ));
      cart.addItem(CartItem(
        id: '2',
        name: 'Chicken Teriyaki',
        type: SandwichType.chickenTeriyaki,
        quantity: 1,
        price: 8.99,
        isFootlong: true,
      ));
      expect(pricingRepository.calculateCartSubtotal(cart), closeTo(4.99 * 2 + 8.99, 0.01));
    });
  });
}
