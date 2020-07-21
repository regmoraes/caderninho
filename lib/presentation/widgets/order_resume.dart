import 'package:caderninho/order/bloc.dart';
import 'package:caderninho/presentation/widgets/currency_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderResume extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    return Consumer<OrderBloc>(
      builder: (context, orderBloc, _) => Container(
        height: 40,
        width: width,
        child: BottomAppBar(
          color: Colors.blue,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Total: ",
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              CurrencyText(
                orderBloc.ongoingOrder?.totalPrice ?? 0,
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
