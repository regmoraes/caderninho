import 'dart:async';

import 'package:caderninho/bloc/customer_states.dart';
import 'package:caderninho/infrastructure/customer_repository.dart';
import 'package:caderninho/model/customer/customer.dart';
import 'package:caderninho/model/customer/search.dart';

class CustomersBloc {
  final CustomerRepository customerRepository;

  final _customersStream = StreamController<CustomersState>.broadcast();

  Stream<CustomersState> get state => _customersStream.stream;

  CustomersBloc(this.customerRepository);

  void addCustomer(Customer customer) async {
    await customerRepository.addCustomer(customer);
    _customersStream.add(CustomerAdded(customer));
  }

  void fetchCustomer(CustomerSearch search) async {
    if (search is FetchAll) {
      final customers = await customerRepository.fetchAll();
      _customersStream.add(Fetched(customers));
    }
  }
}
