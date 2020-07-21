import 'package:caderninho/order/order.dart';
import 'package:caderninho/widget/currency_text.dart';
import 'package:caderninho/widget/date_time_text.dart';
import 'package:flutter/material.dart';

class ClosedOrderItemWidget extends StatelessWidget {
  final Order order;

  ClosedOrderItemWidget(this.order);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("#${order.id}"),
            DateTimeText(order.date),
            CurrencyText(order.totalPrice),
          ],
        ),
      ),
    );
  }
}
