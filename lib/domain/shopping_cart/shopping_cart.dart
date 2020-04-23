import 'dart:collection';

import 'package:caderninho/domain/catalog/product.dart';

import 'cart_item.dart';

class ShoppingCart {
  int _totalPrice = 0;

  int get totalPrice => _totalPrice;

  HashMap<int, CartItem> _items = HashMap();

  List<CartItem> get cartItems =>
      _items.entries.map((entry) => entry.value).toList();

  int get itemsCount => cartItems
      .map((cartItem) => cartItem.quantity)
      .reduce((acc, quantity) => acc + quantity);

  void add(Product product) {
    CartItem cartItem = _items[product.id];

    if (cartItem != null)
      cartItem.quantity++;
    else
      _items[product.id] = CartItem(product);

    _totalPrice += product.price;
  }

  void remove(int productId) {
    CartItem cartItem = _items[productId];

    if (cartItem != null) {
      if (cartItem.quantity > 1)
        cartItem.quantity--;
      else
        _items.remove(productId);

      _totalPrice -= cartItem.product.price;
    }
  }
}
