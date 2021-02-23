import 'file:///C:/Users/regmoraes/Projects/caderninho/lib/order/bloc/order_bloc.dart';
import 'package:caderninho/order/order_item.dart';
import 'package:caderninho/order/order_type.dart';
import 'package:caderninho/order/repository/in_memory_repository.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../test_stubs.dart';


void main() {
  OrderBloc orderBloc;

  group('Given an empty Order', () {
    setUp(() {
      orderBloc = OrderBloc(InMemoryOrder());
      orderBloc.newOrder(testerCustomer, OrderType.CASH);
    });

    test("When asking if It is empty It should return true", () {
      expect(orderBloc.ongoingOrder.isEmpty, true);
    });

    test("When adding products It should increase items count", () {
      orderBloc.addProduct(ball);
      orderBloc.addProduct(bat);

      expect(
        orderBloc.ongoingOrder.items,
        [OrderItem(ball, quantity: 1), OrderItem(bat, quantity: 1)],
      );

      expect(orderBloc.ongoingOrder.itemsCount, 2);
    });

    test(
        "When adding same product It should update total and unique items count",
        () {
      orderBloc.addProduct(ball);
      orderBloc.addProduct(ball);

      expect(
        orderBloc.ongoingOrder.items,
        [OrderItem(ball, quantity: 2)],
      );

      expect(orderBloc.ongoingOrder.itemsCount, 2);
    });

    test("When products are added It should not be empty", () {
      orderBloc.addProduct(ball);
      expect(orderBloc.ongoingOrder.isEmpty, false);
    });
  });

  group('Given a non empty Order', () {
    setUp(() {
      orderBloc = OrderBloc(InMemoryOrder());
      orderBloc.newOrder(testerCustomer, OrderType.CASH);
      orderBloc.addProduct(ball);
      orderBloc.addProduct(bat);
    });

    test("When removing item It should decrease item count", () {
      orderBloc.removeProduct(ball.id);

      expectLater(orderBloc.ongoingOrder.itemsCount, 1);
    });
  });
}
