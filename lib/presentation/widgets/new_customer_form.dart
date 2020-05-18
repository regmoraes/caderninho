import 'dart:math';

import 'package:caderninho/bloc/customer_states.dart';
import 'package:caderninho/bloc/customers_bloc.dart';
import 'package:caderninho/model/customer/customer.dart';
import 'package:flutter/material.dart';

class CustomerForm extends StatelessWidget {
  final CustomersBloc _customersBloc;
  final _formController = _FormController();

  CustomerForm(this._customersBloc);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextField(
          controller: _formController.name,
        ),
        StreamBuilder(
          stream: _customersBloc.state,
          builder: (context, snapshot) {
            if (snapshot.data is CustomersState) {
              return RaisedButton(
                child: CircularProgressIndicator(),
                onPressed: null,
              );
            } else {
              return RaisedButton(
                child: Text("Ok"),
                onPressed: () {
                  final customer = _formController.toCustomer();
                  _customersBloc.addCustomer(customer);
                },
              );
            }
          },
        ),
      ],
    );
  }
}

class _FormController {
  final name = TextEditingController();
  final description = TextEditingController();
  final price = TextEditingController();

  Customer toCustomer() {
    return Customer(
      // TODO Remove random id generation
      id: Random().nextInt(100),
      name: name.text,
    );
  }
}
