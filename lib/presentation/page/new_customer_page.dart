import 'dart:math';

import 'package:caderninho/customer/bloc.dart';
import 'package:caderninho/customer/customer.dart';
import 'package:caderninho/presentation/widgets/custom_text_field.dart';
import 'package:caderninho/presentation/widgets/import_contact.dart';
import 'package:caderninho/presentation/widgets/ok_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../navigator.dart';

class NewCustomerPage extends StatefulWidget {
  @override
  _NewCustomerPageState createState() => _NewCustomerPageState();
}

class _NewCustomerPageState extends State<NewCustomerPage> {
  final title = "Novo Cliente";
  final _formController = _FormController();

  @override
  Widget build(BuildContext context) {
    final customerBloc = Provider.of<CustomerBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[
          ImportContact(
            onContactImported: (contact) {
              _formController.name.text = contact.name;
              _formController.phoneNumber.text = contact.phoneNumber;
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CustomTextField(
              hintText: "Nome",
              controller: _formController.name,
            ),
            const SizedBox(height: 8),
            CustomTextField(
              hintText: "Telefone",
              controller: _formController.phoneNumber,
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
  final phoneNumber = TextEditingController();

  Customer buildCustomer() {
    return Customer(
      // TODO Remove random id generation
      id: Random().nextInt(100),
      name: name.text,
      phoneNumber: phoneNumber.text,
    );
  }
}
