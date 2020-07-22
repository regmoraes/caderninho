import 'package:caderninho/customer/customer.dart';
import 'package:caderninho/order/order.dart';
import 'package:caderninho/order/order_type.dart';
import 'package:flutter/material.dart';

class OrderDetailHeader extends StatelessWidget {
  final Order order;
  final Customer customer;

  OrderDetailHeader(this.order, this.customer);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      color: Colors.blue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Pedido #${order.id}",
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
              Text(
                "Tipo de Venda: ${order.orderType.name}",
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            "${customer.name}",
            style: TextStyle(fontSize: 14, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
