import 'package:flutter/material.dart';
import 'package:sandwich_shop/models/cart.dart';
import 'package:sandwich_shop/views/app_styles.dart';

class CartScreen extends StatefulWidget {
  final Cart cart;
  const CartScreen({super.key, required this.cart});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart', style: normalText),
      ),
      body: widget.cart.items.isEmpty
          ? const Center(child: Text('Your cart is empty.'))
          : ListView.builder(
              itemCount: widget.cart.items.length,
              itemBuilder: (context, index) {
                final item = widget.cart.items[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    title: Text(item.name, style: heading1),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Size: ${item.name.toLowerCase().contains("footlong") ? "Footlong" : "Six-inch"}'),
                        Text('Bread: ${item.name.split(" ").first}'),
                        Text('Quantity: ${item.quantity}'),
                        Text('Total: £${(item.price * item.quantity).toStringAsFixed(2)}'),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
