import 'package:caderninho/model/customer/customer.dart';

abstract class CustomerRepository {
  Future<Customer> addCustomer(Customer customer);

  Future<Customer> findCustomer(int customerId);

  Future<List<Customer>> fetchAll();
}
