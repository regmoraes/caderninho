import 'package:caderninho/customer/customer.dart';
import 'package:caderninho/order/bloc.dart';
import 'package:caderninho/widget/closed_orders.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomerDetailsPage extends StatefulWidget {
  final Customer customer;

  CustomerDetailsPage(this.customer);

  @override
  State createState() => _CustomerDetailsPageState();
}

class _CustomerDetailsPageState extends State<CustomerDetailsPage> {
  OrderBloc orderBloc;

  @override
  void initState() {
    super.initState();
    orderBloc = Provider.of<OrderBloc>(context, listen: false);
    orderBloc.fetchCustomerOrders(widget.customer.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.customer.name),
      ),
      body: StreamBuilder(
        stream: orderBloc.ordersResult,
        builder: (context, snapshot) {
          return ClosedOrders(snapshot?.data ?? List());
        },
      ),
    );
  }
}
