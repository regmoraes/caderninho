import 'package:caderninho/order/bloc/order_bloc.dart';
import 'package:caderninho/order/bloc/order_state.dart';
import 'package:caderninho/order/widget/order_detail_header.dart';
import 'package:caderninho/order/widget/order_total.dart';
import 'package:caderninho/order/widget/order_widget.dart';
import 'package:caderninho/page/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class OngoingOrderPage extends StatefulWidget {
  @override
  State createState() => _OngoingOrderPageState();
}

class _OngoingOrderPageState extends State<OngoingOrderPage> {
  final title = "Carrinho";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {
              context.read<OrderBloc>().checkout();
              pop(context);
            },
          )
        ],
      ),
      body: BlocBuilder<OrderBloc, OrderState>(
        builder: (context, state) {
          if (state is OrderUpdated) {
            return Column(
              children: <Widget>[
                OrderDetailHeader(state.order),
                OrderWidget(state.order)
              ],
            );
          } else {
            return Container();
          }
        },
      ),
      bottomNavigationBar: OrderTotal(),
    );
  }
}
