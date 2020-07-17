import 'package:caderninho/customer/bloc.dart';
import 'package:caderninho/customer/customer.dart';
import 'package:caderninho/customer/search.dart';
import 'package:caderninho/customer/states.dart';
import 'package:caderninho/order/bloc.dart';
import 'package:caderninho/presentation/widgets/customers.dart';
import 'package:caderninho/presentation/widgets/ok_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../navigator.dart';

class NewOrderPage extends StatefulWidget {
  final _formController = _FormController();
  final title = "New Order";

  @override
  State createState() => _NewOrderPage();
}

class _NewOrderPage extends State<NewOrderPage> {
  CustomerBloc customerBloc;

  @override
  void initState() {
    super.initState();
    customerBloc = Provider.of<CustomerBloc>(context, listen: false);
    customerBloc.fetchCustomer(FetchAll());
  }

  @override
  Widget build(BuildContext context) {
    final orderBloc = Provider.of<OrderBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            StreamBuilder(
              stream: customerBloc.state,
              builder: (context, snapshot) {
                if (snapshot.data is Fetched) {
                  return Expanded(
                    child: CustomersWidget(
                      snapshot.data.customers,
                      onCustomerClicked: (costumer) {
                        orderBloc.newOrder(costumer);
                        pop(context);
                      },
                    ),
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
            OkButton(
              () {
                if (widget._formController.selectedCustomer != null) {
                  orderBloc.newOrder(widget._formController.selectedCustomer);
                }
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

  Customer selectedCustomer;
}
