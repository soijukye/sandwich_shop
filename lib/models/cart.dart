import 'package:sandwich_shop/models/sandwich.dart';
import 'package:sandwich_shop/repositories/pricing_repository.dart';

class CartItem {
  final String id;
  final String name;
  final SandwichType type;
  final int quantity;
  final double price;
  final bool isFootlong;
  final BreadType breadType;

  CartItem({
    required this.id,
    required this.name,
    required this.type,
    this.quantity = 1,
    required this.price,
    required this.isFootlong,
    required this.breadType,
  });

  CartItem copyWith({int? quantity}) {
    return CartItem(
      id: id,
      name: name,
      type: type,
      quantity: quantity ?? this.quantity,
      price: price,
      isFootlong: isFootlong,
      breadType: breadType,
    );
  }
}


class Cart {
  final Map<String, CartItem> _items = {};
  final PricingRepository pricingRepository;

  Cart({required this.pricingRepository});

  List<CartItem> get items => _items.values.toList();

  double get totalPrice {
    return pricingRepository.calculateCartTotal(this);
  }

  String _itemKey(CartItem item) {
    return '${item.type.name}_${item.isFootlong}_${item.breadType.name}';
  }

  void addItem(CartItem item) {
    final key = _itemKey(item);
    if (_items.containsKey(key)) {
      _items.update(
        key,
        (existing) => existing.copyWith(quantity: existing.quantity + item.quantity),
      );
    } else {
      _items[key] = item;
    }
  }

  void removeItem(String id) {
    if (_items.containsKey(id)) {
      final item = _items[id]!;
      if (item.quantity > 1) {
        _items.update(
          id,
          (existing) => existing.copyWith(quantity: existing.quantity - 1),
        );
      } else {
        _items.remove(id);
      }
    }
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