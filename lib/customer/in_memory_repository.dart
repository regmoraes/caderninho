import 'customer.dart';
import 'repository.dart';

class InMemoryCustomers implements CustomerRepository {
  final _customers = List<Customer>();

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
