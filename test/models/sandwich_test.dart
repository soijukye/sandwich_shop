import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/models/sandwich.dart';

void main() {
  group('Sandwich Model', () {
    test('Sandwich name returns correct string', () {
      expect(
        Sandwich(
          id: '1',
          type: SandwichType.veggieDelight,
          isFootlong: false,
          breadType: BreadType.white,
          description: 'Veggie sandwich',
          available: true,
        ).name,
        'Veggie Delight',
      );
      expect(
        Sandwich(
          id: '2',
          type: SandwichType.chickenTeriyaki,
          isFootlong: true,
          breadType: BreadType.wheat,
          description: 'Chicken sandwich',
          available: true,
        ).name,
        'Chicken Teriyaki',
      );
      expect(
        Sandwich(
          id: '3',
          type: SandwichType.tunaMelt,
          isFootlong: false,
          breadType: BreadType.wholemeal,
          description: 'Tuna sandwich',
          available: true,
        ).name,
        'Tuna Melt',
      );
      expect(
        Sandwich(
          id: '4',
          type: SandwichType.meatballMarinara,
          isFootlong: true,
          breadType: BreadType.white,
          description: 'Meatball sandwich',
          available: true,
        ).name,
        'Meatball Marinara',
      );
    });

    test('Sandwich image returns correct asset path', () {
      expect(
        Sandwich(
          id: '1',
          type: SandwichType.veggieDelight,
          isFootlong: false,
          breadType: BreadType.white,
          description: 'Veggie sandwich',
          available: true,
        ).image,
        'assets/images/veggieDelight_six_inch.png',
      );
      expect(
        Sandwich(
          id: '2',
          type: SandwichType.chickenTeriyaki,
          isFootlong: true,
          breadType: BreadType.wheat,
          description: 'Chicken sandwich',
          available: true,
        ).image,
        'assets/images/chickenTeriyaki_footlong.png',
      );
      expect(
        Sandwich(
          id: '3',
          type: SandwichType.tunaMelt,
          isFootlong: false,
          breadType: BreadType.wholemeal,
          description: 'Tuna sandwich',
          available: true,
        ).image,
        'assets/images/tunaMelt_six_inch.png',
      );
      expect(
        Sandwich(
          id: '4',
          type: SandwichType.meatballMarinara,
          isFootlong: true,
          breadType: BreadType.white,
          description: 'Meatball sandwich',
          available: true,
        ).image,
        'assets/images/meatballMarinara_footlong.png',
      );
    });

    test('Sandwich properties are set correctly', () {
      final sandwich = Sandwich(
        id: '5',
        type: SandwichType.tunaMelt,
        isFootlong: true,
        breadType: BreadType.wholemeal,
        description: 'Tuna sandwich',
        available: true,
      );
      expect(sandwich.type, SandwichType.tunaMelt);
      expect(sandwich.isFootlong, true);
      expect(sandwich.breadType, BreadType.wholemeal);
    });
  });
}