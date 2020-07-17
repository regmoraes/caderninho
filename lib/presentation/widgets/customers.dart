import 'package:caderninho/customer/customer.dart';
import 'package:caderninho/presentation/widgets/customer_item.dart';
import 'package:flutter/material.dart';

class CustomersWidget extends StatelessWidget {
  final List<Customer> customers;
  final OnCustomerClicked onCustomerClicked;

  CustomersWidget(this.customers, {this.onCustomerClicked});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: customers.length,
      itemBuilder: (context, index) => CustomerItemWidget(customers[index],
          onCustomerClicked: onCustomerClicked),
    );
  }
}
