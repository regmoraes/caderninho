import 'package:caderninho/model/cart/shopping_cart.dart';
import 'package:caderninho/model/catalog/product.dart';
import 'package:flutter/material.dart';

class ShoppingCartBloc with ChangeNotifier {
  final shoppingCart = ShoppingCart();

  void addToCart(Product product) {
    shoppingCart.add(product);
    notifyListeners();
  }

  void removeFromCart(int productId) {
    shoppingCart.remove(productId);
    notifyListeners();
  }

  void clearCart() {
    shoppingCart.clear();
    notifyListeners();
  }
}
