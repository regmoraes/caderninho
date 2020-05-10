import 'dart:collection';

import 'package:caderninho/domain/cart/cart_item.dart';
import 'package:caderninho/domain/catalog/product.dart';
import 'package:flutter/material.dart';

class CartBloc with ChangeNotifier {
  final _cartItemsMap = HashMap<int, CartItem>();

  List<CartItem> get cartItems => _cartItemsMap.values.toList();

  int get totalPrice => cartItems
      .map((item) => item.product.price * item.quantity)
      .fold(0, (total, cartItemPrice) => total + cartItemPrice);

  int get itemsCount =>
      cartItems
      .map((cartItem) => cartItem.quantity)
          .fold(0, (total, quantity) => total + quantity);

  bool get isEmpty => itemsCount == 0;

  void add(Product product) {
    CartItem cartItem = _cartItemsMap[product.id];

    if (cartItem != null)
      cartItem.quantity++;
    else
      _cartItemsMap[product.id] = CartItem(product);

    notifyListeners();
  }

  void remove(int productId) {
    CartItem cartItem = _cartItemsMap[productId];

    if (cartItem != null) {
      if (cartItem.quantity > 1)
        cartItem.quantity--;
      else
        _cartItemsMap.remove(productId);

      notifyListeners();
    }
  }

  void clear() {
    _cartItemsMap.clear();
    notifyListeners();
  }
}
