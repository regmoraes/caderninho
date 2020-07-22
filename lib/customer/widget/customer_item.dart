import 'package:caderninho/customer/customer.dart';
import 'package:flutter/material.dart';

typedef void OnCustomerClicked(Customer customer);

class CustomerItemWidget extends StatelessWidget {
  final Customer customer;
  final OnCustomerClicked onCustomerClicked;

  CustomerItemWidget(this.customer, {this.onCustomerClicked});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ListTile(
        leading: Icon(Icons.person),
        title: Text("${customer.name}"),
      ),
      onTap: () => onCustomerClicked?.call(customer),
    );
  }
}
