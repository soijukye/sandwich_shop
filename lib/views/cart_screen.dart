import 'package:flutter/material.dart';
import 'package:sandwich_shop/models/cart.dart';
import 'package:sandwich_shop/views/app_styles.dart';
import 'package:sandwich_shop/views/checkout_screen.dart';

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
        actions: [
          if (widget.cart.items.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.delete_forever),
              tooltip: 'Empty Cart',
              onPressed: () {
                setState(() {
                  widget.cart.clear();
                });
              },
            ),
        ],
      ),
      body: Column(
        children: [
          if (widget.cart.items.isEmpty)
            const Expanded(child: Center(child: Text('Your cart is empty.')))
          else
            Expanded(
              child: ListView.builder(
                itemCount: widget.cart.items.length,
                itemBuilder: (context, index) {
                  final item = widget.cart.items[index];
                  final itemKey = '${item.type.name}_${item.isFootlong}_${item.breadType.name}';
                  return Card(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: ListTile(
                      title: Text(item.name, style: heading1),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Size: ${item.isFootlong ? "Footlong" : "Six-inch"}'),
                          Text('Bread: ${item.breadType.name}'),
                          Text('Quantity: ${item.quantity}'),
                          Text('Total: £${(item.price * item.quantity).toStringAsFixed(2)}'),
                        ],
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        tooltip: 'Remove Item',
                        onPressed: () {
                          setState(() {
                            widget.cart.removeItem(itemKey);
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: Colors.grey[200],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Total Price: £${widget.cart.totalPrice.toStringAsFixed(2)}',
                  style: heading1,
                  textAlign: TextAlign.right,
                ),
                const SizedBox(height: 12),
                ElevatedButton.icon(
                  onPressed: widget.cart.items.isNotEmpty
                      ? () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => CheckoutScreen(cart: widget.cart),
                            ),
                          );
                        }
                      : null,
                  icon: const Icon(Icons.payment, color: Colors.white),
                  label: const Text('Checkout', style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: widget.cart.items.isNotEmpty ? Colors.green : Colors.grey,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
