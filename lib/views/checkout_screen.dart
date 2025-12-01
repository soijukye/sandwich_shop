import 'package:flutter/material.dart';
import 'package:sandwich_shop/models/cart.dart';
import 'package:sandwich_shop/models/drawer.dart';
import 'package:sandwich_shop/views/app_styles.dart';

class CheckoutScreen extends StatelessWidget {
  final Cart cart;
  const CheckoutScreen({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout', style: heading1),
      ),
      drawer: SandwichShopDrawer(cart: cart),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Order Summary', style: heading1),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: cart.items.length,
                itemBuilder: (context, index) {
                  final item = cart.items[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(item.name, style: heading2),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Size: ${item.isFootlong ? "Footlong" : "Six-inch"}'),
                          Text('Bread: ${item.breadType.name}'),
                          Text('Quantity: ${item.quantity}'),
                        ],
                      ),
                      trailing: Text('£${(item.price * item.quantity).toStringAsFixed(2)}', style: heading2),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Text('Total: £${cart.totalPrice.toStringAsFixed(2)}', style: heading1, textAlign: TextAlign.right),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: cart.items.isNotEmpty ? () {
                // TODO: Implement payment logic
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Order Placed!'),
                    content: const Text('Thank you for your purchase.'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              } : null,
              icon: const Icon(Icons.check_circle, color: Colors.white),
              label: const Text('Place Order', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: cart.items.isNotEmpty ? Colors.green : Colors.grey,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
