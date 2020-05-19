import 'dart:collection';

import 'package:caderninho/model/catalog/product.dart';
import 'package:caderninho/model/customer/customer.dart';
import 'package:equatable/equatable.dart';

import 'order_item.dart';

class Order extends Equatable {
  final int id;
  final Customer customer;
  final _itemsMap = HashMap<int, OrderItem>();

  Order({this.id, this.customer});

  List<OrderItem> get items => List.unmodifiable(_itemsMap.values);

  int get totalPrice => items
      .map((item) => item.product.price * item.quantity)
      .fold(0, (total, cartItemPrice) => total + cartItemPrice);

  int get itemsCount => items
      .map((cartItem) => cartItem.quantity)
      .fold(0, (total, quantity) => total + quantity);

  bool get isEmpty => itemsCount == 0;

  void add(Product product) {
    OrderItem cartItem = _itemsMap[product.id];

    if (cartItem != null)
      cartItem.quantity++;
    else
      _itemsMap[product.id] = OrderItem(product);
  }

  void remove(int productId) {
    OrderItem cartItem = _itemsMap[productId];

    if (cartItem != null) {
      if (cartItem.quantity > 1)
        cartItem.quantity--;
      else
        _itemsMap.remove(productId);
    }
  }

  void clear() {
    _itemsMap.clear();
  }

  @override
  List<Object> get props => [
        id,
        customer,
      ];
}
