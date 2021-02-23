import 'package:caderninho/order/bloc/order_bloc.dart';
import 'package:caderninho/order/bloc/order_state.dart';
import 'package:caderninho/widget/currency_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    return Container(
      height: 40,
      width: width,
      child: BlocBuilder<OrderBloc, OrderState>(
        builder: (context, state) {
          return BottomAppBar(
            color: Colors.blue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Total: ",
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                CurrencyText(
                  state is OrderUpdated ? state.order.totalPrice : 0,
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
