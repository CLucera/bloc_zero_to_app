import 'package:bloc_zero_to_app/shop_item.dart';

class CartItem {
  final ShopItem shopItem;
  final int quantity;

  CartItem(
    this.shopItem,
    this.quantity,
  );
}
