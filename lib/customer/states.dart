import 'package:equatable/equatable.dart';

import 'customer.dart';

abstract class CustomerState extends Equatable {}

class Fetched extends CustomerState {
  final List<Customer> customers;

  Fetched(this.customers);

  @override
  List<Object> get props => [customers];
}

class Fetching extends CustomerState {
  @override
  List<Object> get props => [];
}

class Error extends CustomerState {
  @override
  List<Object> get props => [];
}

class CustomerAdded extends CustomerState {
  final Customer customer;

  CustomerAdded(this.customer);

  @override
  List<Object> get props => [customer];
}
