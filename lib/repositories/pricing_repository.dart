import 'package:sandwich_shop/models/sandwich.dart';
import 'package:sandwich_shop/models/cart.dart';

class PricingRepository {
    double getSandwichPrice(SandwichType type, bool isFootlong) {
      if (isFootlong) {
        return footlongPrice;
      } else {
        return sixInchPrice;
      }
    }
  final double sixInchPrice;
  final double footlongPrice;

  PricingRepository({required this.sixInchPrice, required this.footlongPrice});

  double getPrice(SandwichType type, int footlongCount) {
    
    if (SandwichType.values.contains(type)) {
      return sixInchPrice;
    } else {
      return footlongPrice;
    }
  }

  double calculateSubtotal(int quantity, SandwichType type) {
    return getPrice(type, quantity) * quantity;
  }

  double calculateCartSubtotal(Cart cart) {
    double subtotal = 0.0;
    for (final item in cart.items) {
      subtotal += calculateSubtotal(item.quantity, item.type);
    }
    return subtotal;
  }

  double calculateCartTotal(Cart cart) {
    return calculateCartSubtotal(cart);
  }
}