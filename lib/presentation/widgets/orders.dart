import 'package:caderninho/model/order/order.dart';
import 'package:flutter/material.dart';

class OrdersWidget extends StatelessWidget {
  final List<Order> orders;

  OrdersWidget(this.orders);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context, index) => _customerEntry(context, orders[index]),
    );
  }

  Widget _customerEntry(BuildContext context, Order order) {
    return GestureDetector(
      child: ListTile(
        leading: Icon(Icons.shopping_cart),
        title: Text("${order.customer.name}"),
        trailing: Text("\$ ${order.totalPrice}"),
      ),
    );
  }
}
