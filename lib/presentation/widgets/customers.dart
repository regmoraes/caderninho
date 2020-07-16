import 'package:caderninho/customer/customer.dart';
import 'package:flutter/material.dart';

class CustomersWidget extends StatelessWidget {
  final List<Customer> customers;
  final void Function(Customer customer) onCustomerClick;

  CustomersWidget(this.customers, [this.onCustomerClick]);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: customers.length,
      itemBuilder: (context, index) =>
          _customerEntry(context, customers[index]),
    );
  }

  Widget _customerEntry(BuildContext context, Customer costumer) {
    return GestureDetector(
      child: ListTile(
        leading: Icon(Icons.person),
        title: Text("${costumer.name}"),
      ),
      onTap: () {
        if (onCustomerClick != null) onCustomerClick(costumer);
      },
    );
  }
}
