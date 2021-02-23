import 'package:caderninho/customer/customer.dart';
import 'package:caderninho/customer/repository/repository.dart';

class InMemoryCustomers implements CustomerRepository {
  final _customers = List<Customer>();

  InMemoryCustomers() {
    _customers.add(Customer(id: 0, name: "A Customer", phoneNumber: "12345"));
    _customers
        .add(Customer(id: 1, name: "Another customer", phoneNumber: "67890"));
  }

  @override
  Future<Customer> addCustomer(Customer customer) {
    _customers.add(customer);
    return Future.value(customer);
  }

  @override
  Future<Customer> findCustomer(int customerId) {
    final customer = _customers
        .firstWhere((customer) => customer.id == customerId, orElse: null);

    return Future.value(customer);
  }

  @override
  Future<List<Customer>> fetchAll() {
    return Future.value(List.unmodifiable(_customers));
  }
}
