import 'package:bloc_zero_to_app/shop_item.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

import 'cart.dart';
import 'cart_page.dart';

class ShoppingPage extends StatefulWidget {
  const ShoppingPage({super.key});

  @override
  State<ShoppingPage> createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  var cart = Cart([]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Smart Cart"),
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Center(
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => CartPage(cart: cart,),
                        ),
                      );
                    },
                    icon: Icon(Icons.shopping_cart),
                  ),
                ),
                if (cart.items.isNotEmpty)
                  Badge(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    label: Text("${cart.getTotalItemQuantity()}"),
                  ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Center(
          child: Text(
            "Cart Total: €${cart.getTotalPrice().toStringAsFixed(2)}",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: mockItems.length,
        itemBuilder: (context, index) {
          final item = mockItems[index];
          return ListTile(
              leading: Icon(
                item.icon,
                size: 50,
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
              title: Text(item.name),
              subtitle: Text(item.description),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        cart = cart.reduceItem(item);
                      });
                    },
                    icon: Icon(Icons.remove),
                  ),
                  Text("${cart.getItemQuantity(item)}"),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        cart = cart.addItem(item);
                      });
                    },
                    icon: const Icon(Icons.add),
                  )
                ],
              ));
        },
      ),
    );
  }
}
