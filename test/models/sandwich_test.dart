import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/models/sandwich.dart';

void main() {
  group('Sandwich Model', () {
    test('Sandwich name returns correct string', () {
      expect(
        Sandwich(
          type: SandwichType.veggieDelight,
          isFootlong: false,
          breadType: BreadType.white,
        ).name,
        'Veggie Delight',
      );
      expect(
        Sandwich(
          type: SandwichType.chickenTeriyaki,
          isFootlong: true,
          breadType: BreadType.wheat,
        ).name,
        'Chicken Teriyaki',
      );
      expect(
        Sandwich(
          type: SandwichType.tunaMelt,
          isFootlong: false,
          breadType: BreadType.wholemeal,
        ).name,
        'Tuna Melt',
      );
      expect(
        Sandwich(
          type: SandwichType.meatballMarinara,
          isFootlong: true,
          breadType: BreadType.white,
        ).name,
        'Meatball Marinara',
      );
    });

    test('Sandwich image returns correct asset path', () {
      expect(
        Sandwich(
          type: SandwichType.veggieDelight,
          isFootlong: false,
          breadType: BreadType.white,
        ).image,
        'assets/images/veggieDelight_six_inch.png',
      );
      expect(
        Sandwich(
          type: SandwichType.chickenTeriyaki,
          isFootlong: true,
          breadType: BreadType.wheat,
        ).image,
        'assets/images/chickenTeriyaki_footlong.png',
      );
      expect(
        Sandwich(
          type: SandwichType.tunaMelt,
          isFootlong: false,
          breadType: BreadType.wholemeal,
        ).image,
        'assets/images/tunaMelt_six_inch.png',
      );
      expect(
        Sandwich(
          type: SandwichType.meatballMarinara,
          isFootlong: true,
          breadType: BreadType.white,
        ).image,
        'assets/images/meatballMarinara_footlong.png',
      );
    });

    test('Sandwich properties are set correctly', () {
      final sandwich = Sandwich(
        type: SandwichType.tunaMelt,
        isFootlong: true,
        breadType: BreadType.wholemeal,
      );
      expect(sandwich.type, SandwichType.tunaMelt);
      expect(sandwich.isFootlong, true);
      expect(sandwich.breadType, BreadType.wholemeal);
    });
  });
}