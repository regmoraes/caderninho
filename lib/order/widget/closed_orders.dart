import 'package:caderninho/order/order.dart';
import 'package:caderninho/order/widget/closed_order_item.dart';
import 'package:flutter/material.dart';

class FinishedOrders extends StatelessWidget {
  final List<Order> orders;

  FinishedOrders(this.orders);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context, index) => ClosedOrderItemWidget(orders[index]),
    );
  }
}
