import 'package:caderninho/bloc/customer_states.dart';
import 'package:caderninho/bloc/customers_bloc.dart';
import 'package:caderninho/model/customer/search.dart';
import 'package:caderninho/presentation/page/new_customer_page.dart';
import 'package:caderninho/presentation/widgets/customers.dart';
import 'package:caderninho/presentation/widgets/navigation_drawer.dart';
import 'package:caderninho/presentation/widgets/order_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../navigator.dart';

class CustomersPage extends StatefulWidget {
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
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[OrderIcon()],
      ),
      body: StreamBuilder(
        stream: customerBloc.state,
        builder: (context, snapshot) {
          if (snapshot.data is Fetched)
            return CustomersWidget(snapshot.data.customers);
          else
            return Center(child: CircularProgressIndicator());
        },
      ),
      drawer: NavigationDrawer(),
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
