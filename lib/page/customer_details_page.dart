import 'package:caderninho/customer/customer.dart';
import 'package:caderninho/order/bloc/order_history_bloc.dart';
import 'package:caderninho/order/bloc/order_history_state.dart';
import 'package:caderninho/order/widget/closed_order_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerDetailsPage extends StatefulWidget {
  final Customer customer;

  CustomerDetailsPage(this.customer);

  @override
  State createState() => _CustomerDetailsPageState();
}

class _CustomerDetailsPageState extends State<CustomerDetailsPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<OrderHistoryBloc>(context)
      ..fetchCustomerOrders(widget.customer.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.customer.name),
      ),
      body: BlocBuilder<OrderHistoryBloc, OrderHistoryState>(
        builder: (context, state) {
          if (state is OrdersFetched) {
            return ListView.builder(
              itemCount: state.orders.length,
              itemBuilder: (context, index) =>
                  ClosedOrderItemWidget(state.orders[index]),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
