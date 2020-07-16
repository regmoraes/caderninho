import 'package:caderninho/catalog/product.dart';
import 'package:caderninho/customer/customer.dart';

final testerCustomer = Customer(id: 1, name: "QA Tester");

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
