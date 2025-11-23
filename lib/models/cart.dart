import 'package:sandwich_shop/models/sandwich.dart';
import 'package:sandwich_shop/repositories/pricing_repository.dart';

class CartItem {
  final String id;
  final String name;
  final SandwichType type;
  final int quantity;
  final double price;

  CartItem({
    required this.id,
    required this.name,
    required this.type,
    this.quantity = 1,
    required this.price,
  });

  CartItem copyWith({int? quantity}) {
    return CartItem(
      id: id,
      name: name,
      type: type,
      quantity: quantity ?? this.quantity,
      price: price,
    );
  }
}

class Cart {
  final Map<String, CartItem> _items = {};

  List<CartItem> get items => _items.values.toList();

  double get totalPrice {
    final pricingRepository = PricingRepository(sixInchPrice: 0.0, footlongPrice: 0.0);
    int sixInchCount = items.where((item) => item.type == SandwichType.sixInch).fold(0, (sum, item) => sum + item.quantity);
    int footlongCount = items.where((item) => item.type == SandwichType.footlong).fold(0, (sum, item) => sum + item.quantity);
    return pricingRepository.getPrice(SandwichType.sixInch, sixInchCount) +
        pricingRepository.getPrice(SandwichType.footlong, footlongCount);
  }
 
  void addItem(CartItem item) {
    if (_items.containsKey(item.id)) {
      _items.update(
        item.id,
        (existing) => existing.copyWith(quantity: existing.quantity + item.quantity),
      );
    } else {
      _items[item.id] = item;
    }
  }

  void removeItem(String id) {
    _items.remove(id);
  }

  void clear() {
    _items.clear();
  }

  void updateQuantity(String id, int quantity) {
    if (_items.containsKey(id)) {
      if (quantity <= 0) {
        _items.remove(id);
      } else {
        _items.update(
          id,
          (existing) => existing.copyWith(quantity: quantity),
        );
      }
    }
  }
}