import 'package:caderninho/order/order.dart';
import 'package:caderninho/order/order_resume.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../test_stubs.dart';

void main() {
  Order order;
  group('Given an Order', () {
    setUp(() {
      order = Order(
        id: 1,
        customer: testerCustomer,
        date: DateTime.now().toIso8601String(),
      );
      order.add(ball);
      order.add(ball);
      order.add(ball);
      order.add(bat);
      order.add(bat);
    });

    test('Generate Order Resume', () {
      print(createOrderResume(order));
    });
  });
}
