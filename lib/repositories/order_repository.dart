class OrderRepository {
  int _quantity = 0;
  final int maxQuantity;

  OrderRepository({required this.maxQuantity});

  int get quantity => _quantity;

  bool get canIncrement => _quantity < maxQuantity;
  bool get canDecrement => _quantity > 0;

  void increment() {
    if (canIncrement) {
      _quantity++;
    }
  }

  void decrement() {
    if (canDecrement) {
      _quantity--;
    }
  }
}

enum SandwichType { sixInch, footlong }

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