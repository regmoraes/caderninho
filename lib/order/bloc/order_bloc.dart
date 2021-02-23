import 'dart:math';

import 'package:caderninho/catalog/product.dart';
import 'package:caderninho/customer/customer.dart';
import 'package:caderninho/order/bloc/order_state.dart';
import 'package:caderninho/order/order.dart';
import 'package:caderninho/order/order_type.dart';
import 'package:caderninho/order/repository/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderBloc extends Cubit<OrderState> {
  final OrderRepository _orderRepository;

  Order _order;

  bool get hasOngoingOrder => _order != null;

  OrderBloc(this._orderRepository) : super(OrderInitialState());

  void newOrder(Customer customer, OrderType orderType) {
    _order = Order(
        id: Random().nextInt(100),
        customer: customer,
        date: DateTime.now().toString(),
        orderType: orderType);
    emit(OrderUpdated(_order));
  }

  void addProduct(Product product) {
    _order.add(product);
    emit(OrderUpdated(_order));
  }

  void removeProduct(int productId) {
    _order.remove(productId);
    emit(OrderUpdated(_order));
  }

  void checkout() {
    _orderRepository.saveOrder(_order);
    _order = null;
    emit(OrderUpdated(_order));
  }

  void clearOrder() {
    _order.clear();
    emit(OrderCleared());
  }
}
