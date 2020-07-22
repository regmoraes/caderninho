import 'package:caderninho/order/bloc.dart';
import 'package:caderninho/order/widget/new_order_fab.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage();

  @override
  State createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    final hasOngoingOrder = context.watch<OrderBloc>().hasOngoingOrder;
    return Scaffold(
      body: Center(child: Text("Nothing here")),
      floatingActionButton:
          !hasOngoingOrder ? NewOrderFloatActionButton() : Container(),
    );
  }
}
