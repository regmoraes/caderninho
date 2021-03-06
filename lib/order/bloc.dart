import 'dart:async';
import 'dart:math';

import 'package:caderninho/catalog/product.dart';
import 'package:caderninho/customer/customer.dart';
import 'package:caderninho/order/order.dart';
import 'package:caderninho/order/order_type.dart';
import 'package:caderninho/order/repository.dart';
import 'package:flutter/foundation.dart';

class OrderBloc with ChangeNotifier {
  final OrderRepository _orderRepository;

  Order ongoingOrder;

  bool get hasOngoingOrder => ongoingOrder != null;

  final _ordersStreamController = StreamController<List<Order>>.broadcast();

  Stream<List<Order>> get ordersResult => _ordersStreamController.stream;

  OrderBloc(this._orderRepository);

  void newOrder(Customer customer, OrderType orderType) {
    ongoingOrder = Order(
        id: Random().nextInt(100),
        customer: customer,
        date: DateTime.now().toString(),
        orderType: orderType);
    notifyListeners();
  }

  void addProduct(Product product) {
    ongoingOrder.add(product);
    notifyListeners();
  }

  void removeProduct(int productId) {
    ongoingOrder.remove(productId);
    notifyListeners();
  }

  void checkout() {
    _orderRepository.saveOrder(ongoingOrder);
    ongoingOrder = null;
    notifyListeners();
  }

  void clearOrder() {
    ongoingOrder.clear();
    notifyListeners();
  }

  void fetchCustomerOrders(int customerId) async {
    final orders = await _orderRepository.fetchAllByCustomer(customerId);
    _ordersStreamController.add(orders);
  }
}
