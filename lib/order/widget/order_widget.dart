import 'package:caderninho/order/bloc/order_bloc.dart';
import 'package:caderninho/order/bloc/order_state.dart';
import 'package:caderninho/order/order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'order_item.dart';

class OrderWidget extends StatelessWidget {
  final Order order;

  OrderWidget(this.order);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double itemHeight = (size.height * 0.45);
    final double itemWidth = size.width / 2;

    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: itemWidth / itemHeight,
      ),
      itemCount: order.items.length,
      itemBuilder: (context, index) => OrderItemWidget(order.items[index]),
    );
  }
}
