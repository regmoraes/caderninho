import 'package:caderninho/order/order.dart';
import 'package:caderninho/widget/orders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_stubs.dart';

void main() {
  group("Given an empty Order list", () {
    final ordersResult = List<Order>();

    testWidgets("It shouldn't show any order", (tester) async {
      final ordersWidget = OrdersWidget(ordersResult);

      await tester.pumpWidget(MaterialApp(home: Scaffold(body: ordersWidget)));

      expect(find.byWidget(ordersWidget), findsOneWidget);
      expect(find.byType(Text), findsNothing);
      expect(find.byType(Icon), findsNothing);
    });
  });

  group("Given a non empty Order list", () {
    final orderOne = Order(id: 1, customer: testerCustomer);
    orderOne.add(ball);
    orderOne.add(bat);

    final orderTwo = Order(id: 2, customer: testerCustomer);
    orderTwo.add(bat);
    orderTwo.add(bat);

    final ordersResult = [orderOne, orderTwo];

    testWidgets("It should show customer name and total price", (tester) async {
      final ordersWidget = OrdersWidget(ordersResult);

      await tester.pumpWidget(MaterialApp(home: Scaffold(body: ordersWidget)));

      expect(find.byType(ListTile), findsNWidgets(2));
      expect(find.text("${testerCustomer.name}"), findsNWidgets(2));
      expect(find.text("\$ ${orderOne.totalPrice}"), findsOneWidget);
      expect(find.text("\$ ${orderTwo.totalPrice}"), findsOneWidget);
    });
  });
}
