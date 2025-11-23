import 'package:sandwich_shop/models/sandwich.dart';
import 'package:sandwich_shop/models/cart.dart';
class PricingRepository {
  final Map<SandwichType, double> sixInchPrices;
  final Map<SandwichType, double> footlongPrices;

  PricingRepository({
    required this.sixInchPrices,
    required this.footlongPrices,
  });

  double getSandwichPrice(SandwichType type, bool isFootlong) {
    if (isFootlong) {
      return footlongPrices[type] ?? 8.0;
    } else {
      return sixInchPrices[type] ?? 5.0;
    }
  }

  double calculateSubtotal(int quantity, SandwichType type, bool isFootlong) {
    return getSandwichPrice(type, isFootlong) * quantity;
  }

  double calculateCartSubtotal(Cart cart) {
    double subtotal = 0.0;
    for (final item in cart.items) {
      // You may need to add isFootlong to CartItem for full accuracy
      subtotal += getSandwichPrice(item.type, true) * item.quantity;
    }
    return subtotal;
  }

  double calculateCartTotal(Cart cart) {
    return calculateCartSubtotal(cart);
  }
}