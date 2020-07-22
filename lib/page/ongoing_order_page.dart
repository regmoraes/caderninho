import 'package:caderninho/order/bloc.dart';
import 'package:caderninho/order/widget/order_detail_header.dart';
import 'package:caderninho/order/widget/order_total.dart';
import 'package:caderninho/order/widget/order_widget.dart';
import 'package:caderninho/page/navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OngoingOrderPage extends StatefulWidget {
  @override
  State createState() => _OngoingOrderPageState();
}

class _OngoingOrderPageState extends State<OngoingOrderPage> {
  final title = "Carrinho";

  @override
  Widget build(BuildContext context) {
    final orderBloc = Provider.of<OrderBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {
              orderBloc.checkout();
              pop(context);
            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          OrderDetailHeader(
            orderBloc.ongoingOrder,
            orderBloc.ongoingOrder.customer,
          ),
          OrderWidget()
        ],
      ),
      bottomNavigationBar: OrderTotal(),
    );
  }
}
