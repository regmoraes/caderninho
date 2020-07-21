import 'package:caderninho/order/bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'order_item.dart';

class OrderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double itemHeight = (size.height * 0.45);
    final double itemWidth = size.width / 2;

    return Consumer<OrderBloc>(
      builder: (context, orderBloc, child) {
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: itemWidth / itemHeight,
          ),
          itemCount: orderBloc.ongoingOrder?.items?.length ?? 0,
          itemBuilder: (context, index) =>
              OrderItemWidget(orderBloc.ongoingOrder.items[index]),
        );
      },
    );
  }
}
