import 'package:caderninho/customer/bloc/bloc.dart';
import 'package:caderninho/customer/bloc/state.dart';
import 'package:caderninho/customer/search.dart';
import 'package:caderninho/customer/widget/customers_widget.dart';
import 'package:caderninho/order/bloc/order_history_bloc.dart';
import 'package:caderninho/page/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'customer_details_page.dart';
import 'new_customer_page.dart';

class CustomersPage extends StatefulWidget {
  const CustomersPage();

  @override
  State createState() => _CustomersPageState();
}

class _CustomersPageState extends State<CustomersPage> {
  final title = "Customers";

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CustomerBloc>(context)
    ..fetchCustomer(FetchAll());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CustomerBloc, CustomerState>(
        builder: (context, state) {
          if (state is Fetched)
            return CustomersWidget(
              state.customers,
              onCustomerSelected: (customer) =>
                  push(context, CustomerDetailsPage(customer)),
            );
          else
            return Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.person_add),
        onPressed: () async {
          await push(context, NewCustomerPage());
          context.read<CustomerBloc>().fetchCustomer(EmptySearch());
        },
      ),
    );
  }
}
