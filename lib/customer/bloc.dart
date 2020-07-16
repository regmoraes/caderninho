import 'dart:async';

import 'package:caderninho/customer/repository.dart';
import 'package:caderninho/customer/search.dart';
import 'package:caderninho/customer/states.dart';

import 'customer.dart';

class CustomerBloc {
  final CustomerRepository customerRepository;

  final _customersStream = StreamController<CustomerState>.broadcast();

  Stream<CustomerState> get state => _customersStream.stream;

  CustomerBloc(this.customerRepository);

  void addCustomer(Customer customer) async {
    await customerRepository.addCustomer(customer);
    _customersStream.add(CustomerAdded(customer));
  }

  void fetchCustomer(CustomerSearch search) async {
    if (search is FetchAll || search is EmptySearch) {
      final customers = await customerRepository.fetchAll();
      _customersStream.add(Fetched(customers));
    }
  }
}
