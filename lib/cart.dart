import 'package:bloc_zero_to_app/shop_item.dart';
import 'package:collection/collection.dart';

import 'cart_item.dart';

class Cart {
  final List<CartItem> items;

  Cart(this.items);

  Cart addItem(ShopItem item) {
    final newItems = <CartItem>[];
    var found = false;
    for (final cartItem in items) {
      if (cartItem.shopItem.id == item.id) {
        found = true;
        newItems.add(CartItem(item, cartItem.quantity + 1));
      } else {
        newItems.add(cartItem);
      }
    }

    if (!found) {
      newItems.add(CartItem(item, 1));
    }
    return Cart(newItems);
  }

  Cart reduceItem(ShopItem item) {
    final newItems = <CartItem>[];
    for (final cartItem in items) {
      if (cartItem.shopItem.id == item.id) {
        newItems.add(CartItem(item, cartItem.quantity - 1));
      } else {
        newItems.add(cartItem);
      }
    }

    newItems.removeWhere((element) => element.quantity <= 0);
    return Cart(newItems);
  }

  Cart removeItem(ShopItem item) {
    return Cart(
      items..removeWhere((element) => element.shopItem.id == item.id),
    );
  }

  double getTotalPrice() {
    return items.fold(0.0, (previousValue, element) {
      return previousValue + (element.quantity * element.shopItem.price);
    });
  }

  int getTotalItemQuantity() {
    return items.fold(0, (previousValue, element) {
      return previousValue + element.quantity;
    });
  }

  int getItemQuantity(ShopItem item) {
    final cartItem = items.firstWhereOrNull((element) {
      return element.shopItem.id == item.id;
    });
    return cartItem?.quantity ?? 0;
  }
}
