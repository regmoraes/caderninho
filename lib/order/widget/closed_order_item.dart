import 'package:caderninho/order/order.dart';
import 'package:caderninho/order/order_resume.dart';
import 'package:caderninho/widget/currency_text.dart';
import 'package:caderninho/widget/date_time_text.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class ClosedOrderItemWidget extends StatelessWidget {
  final Order order;

  ClosedOrderItemWidget(this.order);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.all(8),
      child: GestureDetector(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("#${order.id}"),
              DateTimeText(order.date),
              CurrencyText(order.totalPrice),
            ],
          ),
        ),
        onLongPress: () async => await Share.share(createOrderResume(order)),
      ),
    );
  }
}
