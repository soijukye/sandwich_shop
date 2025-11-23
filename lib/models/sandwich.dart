import 'package:sandwich_shop/repositories/pricing_repository.dart';

enum BreadType { white, wheat, wholemeal }

enum SandwichType {
  veggieDelight,
  chickenTeriyaki,
  tunaMelt,
  meatballMarinara
}



class Sandwich {
  final String id;
  final SandwichType type;
  final bool isFootlong;
  final BreadType breadType;
  final String description;
  final bool available;

  Sandwich({
    required this.id,
    required this.type,
    required this.isFootlong,
    required this.breadType,
    required this.description,
    required this.available,
  });

  factory Sandwich.fromJson(Map<String, dynamic> json) {
    return Sandwich(
      id: json['id'] as String,
      type: SandwichType.values.firstWhere(
        (e) => e.name == json['type'],
        orElse: () => SandwichType.veggieDelight,
      ),
      isFootlong: json['isFootlong'] as bool? ?? false,
      breadType: BreadType.values.firstWhere(
        (e) => e.name == json['breadType'],
        orElse: () => BreadType.white,
      ),
      description: json['description'] as String? ?? '',
      available: json['available'] as bool? ?? true,
    );
  }

  String get name {
    switch (type) {
      case SandwichType.veggieDelight:
        return 'Veggie Delight';
      case SandwichType.chickenTeriyaki:
        return 'Chicken Teriyaki';
      case SandwichType.tunaMelt:
        return 'Tuna Melt';
      case SandwichType.meatballMarinara:
        return 'Meatball Marinara';
      
}  }

  String get image {
    String typeString = type.name;
    String sizeString = isFootlong ? 'footlong' : '6Inch';
    return 'assets/images/${typeString}_$sizeString.png';
  }

  double getPrice(PricingRepository pricingRepository) {
    return pricingRepository.getSandwichPrice(type, isFootlong);
  }
}