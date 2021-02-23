import 'dart:async';

import 'package:caderninho/customer/bloc/state.dart';
import 'package:caderninho/customer/repository/repository.dart';
import 'package:caderninho/customer/search.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../customer.dart';

class CustomerBloc extends Cubit<CustomerState> {
  final CustomerRepository customerRepository;

  CustomerBloc(this.customerRepository) : super(Fetching());

  void addCustomer(Customer customer) async {
    await customerRepository.addCustomer(customer);
    emit(CustomerAdded(customer));
  }

  void fetchCustomer(CustomerSearch search) async {
    if (search is FetchAll || search is EmptySearch) {
      final customers = await customerRepository.fetchAll();
      emit(Fetched(customers));
    }
  }
}
