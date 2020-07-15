import 'dart:math';

import 'package:caderninho/bloc/customers_bloc.dart';
import 'package:caderninho/model/customer/customer.dart';
import 'package:caderninho/presentation/widgets/custom_text_field.dart';
import 'package:caderninho/presentation/widgets/ok_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../navigator.dart';

class NewCustomerPage extends StatefulWidget {
  @override
  _NewCustomerPageState createState() => _NewCustomerPageState();
}

class _NewCustomerPageState extends State<NewCustomerPage> {
  final title = "New Customer";
  final _formController = _FormController();

  @override
  Widget build(BuildContext context) {
    final customerBloc = Provider.of<CustomerBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CustomTextField(
              hintText: "Name",
              controller: _formController.name,
            ),
            OkButton(
              () {
                customerBloc.addCustomer(_formController.buildCustomer());
                pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _FormController {
  final name = TextEditingController();
  final description = TextEditingController();
  final price = TextEditingController();

  Customer buildCustomer() {
    return Customer(
      // TODO Remove random id generation
      id: Random().nextInt(100),
      name: name.text,
    );
  }
}
