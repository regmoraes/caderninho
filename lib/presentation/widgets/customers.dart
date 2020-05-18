import 'package:caderninho/bloc/customer_states.dart';
import 'package:caderninho/bloc/customers_bloc.dart';
import 'package:caderninho/model/customer/customer.dart';
import 'package:flutter/material.dart';

class CustomersWidget extends StatelessWidget {
  final CustomersBloc _customersBloc;

  CustomersWidget(this._customersBloc);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _customersBloc.state,
      builder: (context, snapshot) {
        if (snapshot.data is Fetched || snapshot.data is CustomerAdded) {
          final customers = snapshot.data.customers;
          return ListView.builder(
            itemCount: customers.length,
            itemBuilder: (context, index) =>
                _customerEntry(context, customers[index]),
          );
        } else {
          return _loading();
        }
      },
    );
  }

  Widget _customerEntry(BuildContext context, Customer costumer) {
    return GestureDetector(
      child: ListTile(
        leading: Icon(Icons.person),
        title: Text("${costumer.name}"),
      ),
    );
  }

  Widget _loading() {
    return Center(child: CircularProgressIndicator());
  }
}
