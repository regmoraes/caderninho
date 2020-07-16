import 'package:caderninho/order/bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderResume extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<OrderBloc>(
      builder: (context, orderBloc, _) => BottomAppBar(
        color: Colors.blue,
        child: Text(
          "Total price: \$${orderBloc.ongoingOrder?.totalPrice ?? 0}",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
