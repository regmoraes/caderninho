import 'package:caderninho/customer/bloc/bloc.dart';
import 'package:caderninho/customer/bloc/state.dart';
import 'package:caderninho/customer/search.dart';
import 'package:caderninho/customer/widget/customers_widget.dart';
import 'package:caderninho/order/bloc/order_bloc.dart';
import 'package:caderninho/order/order_type.dart';
import 'package:caderninho/order/widget/order_type_selection_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'navigator.dart';

class NewOrderPage extends StatefulWidget {
  final title = "New Order";

  @override
  State createState() => _NewOrderPage();
}

class _NewOrderPage extends State<NewOrderPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CustomerBloc>(context)..fetchCustomer(FetchAll());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: BlocBuilder<CustomerBloc, CustomerState>(
          builder: (context, state) {
            if (state is Fetched) {
              return CustomersWidget(
                state.customers,
                onCustomerSelected: (selectedCustomer) async {
                  final selectedOrderType = await showDialog<OrderType>(
                    context: context,
                    builder: (context) => OrderTypeSelectionAlert(),
                  );
                  context.read<OrderBloc>().newOrder(selectedCustomer, selectedOrderType);
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
