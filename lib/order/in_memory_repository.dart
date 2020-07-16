import 'dart:math';

import 'package:caderninho/customer/customer.dart';

import 'order.dart';
import 'repository.dart';

class InMemoryOrder implements OrderRepository {
  final _orders = List<Order>();

  @override
  Future<Order> newOrder(Customer customer) {
    final order = Order(id: Random().nextInt(100), customer: customer);
    _orders.add(order);
    return Future.value(order);
  }

  @override
  Future<bool> saveOrder(Order order) {
    _orders.add(order);
    return Future.value(true);
  }

  @override
  Future<List<Order>> fetchAll() {
    return Future.value(_orders);
  }
}
