import 'package:caderninho/catalog/product.dart';
import 'package:caderninho/customer/customer.dart';
import 'package:caderninho/order/order.dart';

final testerCustomer = Customer(id: 1, name: "QA Tester");

final emptyOrderOne = Order(
  id: 1,
  customer: testerCustomer,
  date: DateTime.now().toIso8601String(),
);

final emptyOrderTwo = Order(
  id: 2,
  customer: testerCustomer,
  date: DateTime.now().toIso8601String(),
);

final ball = Product(
  id: 1,
  name: "Ball",
  description: "A ball",
  priceInCents: 100,
);

final bat = Product(
  id: 2,
  name: "Bat",
  description: "A baseball bat",
  priceInCents: 500,
);
