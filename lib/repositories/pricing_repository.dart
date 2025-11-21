import 'package:sandwich_shop/models/sandwich.dart';

class PricingRepository {
  final double sixInchPrice;
  final double footlongPrice;

  PricingRepository({required this.sixInchPrice, required this.footlongPrice});

  double getPrice(SandwichType type) {
    return type == SandwichType.sixInch ? sixInchPrice : footlongPrice;
  }

  double calculateSubtotal(int quantity, SandwichType type) {
    return getPrice(type) * quantity;
  }

  double calculateTotal(int quantity, SandwichType type) {
    final subtotal = calculateSubtotal(quantity, type);
    return subtotal;
  }
}