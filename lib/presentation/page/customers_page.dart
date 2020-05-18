import 'package:caderninho/bloc/customer_states.dart';
import 'package:caderninho/bloc/customers_bloc.dart';
import 'package:caderninho/model/customer/search.dart';
import 'package:caderninho/presentation/page/new_customer_page.dart';
import 'package:caderninho/presentation/widgets/cart_icon.dart';
import 'package:caderninho/presentation/widgets/customers.dart';
import 'package:caderninho/presentation/widgets/navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../navigator.dart';

class CustomersPage extends StatefulWidget {
  @override
  State createState() => _CustomersPageState();
}

class _CustomersPageState extends State<CustomersPage> {
  final title = "Customers";
  CustomersBloc customerBloc;

  @override
  void initState() {
    super.initState();
    customerBloc = Provider.of<CustomersBloc>(context, listen: false);
    customerBloc.fetchCustomer(FetchAll());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[CartIcon()],
      ),
      body: CustomersWidget(customerBloc),
      drawer: NavigationDrawer(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.person_add),
        onPressed: () async {
          final addProductResult = await push(context, NewCustomerPage());
          if (addProductResult is CustomerAdded) {
            customerBloc.fetchCustomer(FetchAll());
          }
        },
      ),
    );
  }
}
