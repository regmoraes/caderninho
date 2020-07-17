import 'package:caderninho/customer/customer.dart';

import 'order.dart';

abstract class OrderRepository {
  Future<Order> newOrder(Customer customer);

  Future<List<Order>> fetchAllByCustomer(int customerId);

  Future<bool> saveOrder(Order order);
}
