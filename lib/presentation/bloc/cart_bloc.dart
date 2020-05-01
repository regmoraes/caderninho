import 'dart:async';
import 'dart:collection';

import 'package:caderninho/domain/catalog/product.dart';
import 'package:caderninho/domain/shopping_cart/cart_item.dart';
import 'package:caderninho/presentation/bloc/cart_state.dart';

class CartBloc {
  final _streamController = StreamController<CartState>.broadcast();
  final _cartItemsMap = HashMap<int, CartItem>();

  get state => _streamController.stream;

  get _totalPrice => _cartItemsMap.values
      .map((item) => item.product.price * item.quantity)
      .reduce((total, cartItemPrice) => total + cartItemPrice);

  get _itemsCount => _cartItemsMap.values
      .map((cartItem) => cartItem.quantity)
      .reduce((total, quantity) => total + quantity);

  void add(Product product) {
    CartItem cartItem = _cartItemsMap[product.id];

    if (cartItem != null)
      cartItem.quantity++;
    else
      _cartItemsMap[product.id] = CartItem(product);

    _streamController.add(
      ItemAdded(
        cartItems: _cartItemsMap.values.toList(),
        itemsCount: _itemsCount,
        totalPrice: _totalPrice,
      ),
    );
  }

  void remove(int productId) {
    CartItem cartItem = _cartItemsMap[productId];

    if (cartItem != null) {
      if (cartItem.quantity > 1)
        cartItem.quantity--;
      else
        _cartItemsMap.remove(productId);

      _streamController.add(
        ItemRemoved(
          cartItems: _cartItemsMap.values.toList(),
          itemsCount: _itemsCount,
          totalPrice: _totalPrice,
        ),
      );
    }
  }

  void clear() {
    _cartItemsMap.clear();
    _streamController.add(Empty());
  }

  void close() {
    _streamController.close();
  }
}
