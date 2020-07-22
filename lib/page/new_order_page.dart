import 'package:caderninho/customer/bloc.dart';
import 'package:caderninho/customer/search.dart';
import 'package:caderninho/customer/states.dart';
import 'package:caderninho/order/bloc.dart';
import 'package:caderninho/order/order_type.dart';
import 'package:caderninho/widget/customers_widget.dart';
import 'package:caderninho/widget/order_type_selection_alert.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'navigator.dart';

class NewOrderPage extends StatefulWidget {
  final title = "New Order";

  @override
  State createState() => _NewOrderPage();
}

class _NewOrderPage extends State<NewOrderPage> {
  CustomerBloc customerBloc;

  @override
  void initState() {
    super.initState();
    customerBloc = Provider.of<CustomerBloc>(context, listen: false);
    customerBloc.fetchCustomer(FetchAll());
  }

  @override
  Widget build(BuildContext context) {
    final orderBloc = Provider.of<OrderBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: StreamBuilder(
          stream: customerBloc.state,
          builder: (context, snapshot) {
            if (snapshot.data is Fetched) {
              return CustomersWidget(
                snapshot.data.customers,
                onCustomerSelected: (selectedCustomer) async {
                  final selectedOrderType = await showDialog<OrderType>(
                      context: context,
                      builder: (context) => OrderTypeSelectionAlert());
                  orderBloc.newOrder(selectedCustomer, selectedOrderType);
                  pop(context);
                },
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
