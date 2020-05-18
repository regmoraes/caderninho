import 'package:caderninho/bloc/customer_states.dart';
import 'package:caderninho/bloc/customers_bloc.dart';
import 'package:caderninho/presentation/widgets/new_customer_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../navigator.dart';

class NewCustomerPage extends StatefulWidget {
  @override
  _NewCustomerPageState createState() => _NewCustomerPageState();
}

class _NewCustomerPageState extends State<NewCustomerPage> {
  final title = "New Customer";
  CustomersBloc customersBloc;

  @override
  void initState() {
    super.initState();

    customersBloc = Provider.of<CustomersBloc>(context, listen: false);

    customersBloc.state.listen(
      (state) {
        if (state is CustomerAdded) {
          pop(context, state);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: CustomerForm(customersBloc));
  }
}
