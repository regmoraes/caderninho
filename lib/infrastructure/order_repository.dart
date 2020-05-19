import 'package:caderninho/model/customer/customer.dart';
import 'package:caderninho/model/order/order.dart';

abstract class OrderRepository {
  Future<Order> newOrder(Customer customer);

  Future<Order> fetchOrder(int orderId);
}
