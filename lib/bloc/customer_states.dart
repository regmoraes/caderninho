import 'package:caderninho/model/customer/customer.dart';
import 'package:equatable/equatable.dart';

abstract class CustomersState extends Equatable {}

class Fetched extends CustomersState {
  final List<Customer> customers;

  Fetched(this.customers);

  @override
  List<Object> get props => [customers];
}

class Fetching extends CustomersState {
  @override
  List<Object> get props => [];
}

class Error extends CustomersState {
  @override
  List<Object> get props => [];
}

class CustomerAdded extends CustomersState {
  final Customer customer;

  CustomerAdded(this.customer);

  @override
  List<Object> get props => [customer];
}
