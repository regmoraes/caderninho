import 'package:caderninho/order/bloc/order_bloc.dart';
import 'package:caderninho/order/bloc/order_state.dart';
import 'package:caderninho/order/widget/new_order_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage();

  @override
  State createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Nothing here")),
      floatingActionButton: BlocBuilder<OrderBloc, OrderState>(
        builder: (_, state) {
          if (state is OrderUpdated)
            return Container();
          else
            return NewOrderFloatActionButton();
        },
      ),
    );
  }
}
