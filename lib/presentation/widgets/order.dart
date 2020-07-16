import 'package:caderninho/order/bloc.dart';
import 'package:caderninho/presentation/widgets/order_items.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - 200) / 2;
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
