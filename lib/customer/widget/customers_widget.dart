import 'package:caderninho/customer/customer.dart';
import 'package:flutter/material.dart';

import 'customer_item.dart';

class CustomersWidget extends StatelessWidget {
  final List<Customer> customers;
  final OnCustomerClicked onCustomerSelected;

  CustomersWidget(this.customers, {this.onCustomerSelected});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: customers.length,
      itemBuilder: (context, index) => CustomerItemWidget(customers[index],
          onCustomerClicked: onCustomerSelected),
    );
  }
}
