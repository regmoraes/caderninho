import 'dart:math';

import 'package:caderninho/model/catalog/product.dart';
import 'package:caderninho/model/customer/customer.dart';
import 'package:caderninho/model/order/order.dart';
import 'package:flutter/foundation.dart';

class OrderBloc with ChangeNotifier {
  Order order;

  bool get hasOnGoingOrder => order != null;

  void newOrder(Customer customer) {
    order = Order(id: Random().nextInt(100), customer: customer);
    notifyListeners();
  }

  void addProduct(Product product) {
    order.add(product);
    notifyListeners();
  }

  void removeProduct(int productId) {
    order.remove(productId);
    notifyListeners();
  }

  void clearOrder() {
    order.clear();
    notifyListeners();
  }
}
