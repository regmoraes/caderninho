import 'package:caderninho/customer/bloc.dart';
import 'package:caderninho/customer/search.dart';
import 'package:caderninho/customer/states.dart';
import 'package:caderninho/page/navigator.dart';
import 'package:caderninho/widget/customers_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'customer_details_page.dart';
import 'new_customer_page.dart';

class CustomersPage extends StatefulWidget {
  const CustomersPage();

  @override
  State createState() => _CustomersPageState();
}

class _CustomersPageState extends State<CustomersPage> {
  final title = "Customers";
  CustomerBloc customerBloc;

  @override
  void initState() {
    super.initState();
    customerBloc = Provider.of<CustomerBloc>(context, listen: false);
    customerBloc.fetchCustomer(FetchAll());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: customerBloc.state,
        builder: (context, snapshot) {
          if (snapshot.data is Fetched)
            return CustomersWidget(
              snapshot.data.customers,
              onCustomerClicked: (customer) =>
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
          customerBloc.fetchCustomer(EmptySearch());
        },
      ),
    );
  }
}
