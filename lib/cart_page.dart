import 'package:bloc_zero_to_app/cart.dart';
import 'package:bloc_zero_to_app/shop_item.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({
    required this.cart,
    super.key,
  });

  final Cart cart;

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Cart"),
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: mockItems.length,
              itemBuilder: (context, index) {
                final item = mockItems[index];
                return ListTile(
                  trailing: Text(
                    "€ ${item.price.toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  title: Row(
                    children: [
                      const Text("2 x "),
                      Icon(
                        item.icon,
                        color: Theme.of(context).colorScheme.primaryContainer,
                      ),
                      const SizedBox(width: 4.0),
                      Expanded(child: Text(item.name)),
                    ],
                  ),
                  subtitle: Text("Price: € ${item.price.toStringAsFixed(2)}"),
                  leading: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.delete),
                  ),
                );
              },
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {},
              child: Text("Checkout"),
            ),
          ),
        ],
      ),
    );
  }
}
