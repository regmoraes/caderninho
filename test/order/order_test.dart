import 'package:caderninho/order/order.dart';
import 'package:caderninho/order/order_item.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_stubs.dart';

void main() {
  Order order;

  group('Given an empty Order', () {
    setUp(() {
      order = Order(id: 1, customer: testerCustomer);
    });

    test("When asking if It is empty It should return true", () {
      expect(order.isEmpty, true);
    });

    test("When adding products It should increase items count", () {
      order.add(ball);
      order.add(bat);

      expect(
        order.items,
        [OrderItem(ball, quantity: 1), OrderItem(bat, quantity: 1)],
      );

      expect(order.itemsCount, 2);
    });

    test(
        "When adding same product It should update total and unique items count",
        () {
      order.add(ball);
      order.add(ball);

      expect(
        order.items,
        [OrderItem(ball, quantity: 2)],
      );

      expect(order.itemsCount, 2);
    });

    test("When products are added It should not be empty", () {
      order.add(ball);
      expect(order.isEmpty, false);
    });
  });

  group('Given a non empty Order', () {
    setUp(() {
      order = Order(id: 1, customer: testerCustomer);
      order.add(ball);
      order.add(bat);
    });

    test("When removing item It should decrease item count", () {
      order.remove(ball.id);

      expectLater(order.itemsCount, 1);
    });
  });
}
