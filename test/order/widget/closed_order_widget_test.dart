import 'package:caderninho/order/order.dart';
import 'package:caderninho/order/widget/closed_order_item.dart';
import 'package:caderninho/order/widget/closed_orders.dart';
import 'package:caderninho/widget/currency_text.dart';
import 'package:caderninho/widget/date_time_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../test_stubs.dart';

void main() {
  group("Given an empty Order list", () {
    final ordersResult = List<Order>();

    testWidgets("It shouldn't show any order", (tester) async {
      final ordersWidget = FinishedOrders(ordersResult);

      await tester.pumpWidget(MaterialApp(home: Scaffold(body: ordersWidget)));

      expect(find.byWidget(ordersWidget), findsOneWidget);
      expect(find.byType(ClosedOrderItemWidget), findsNothing);
    });
  });

  group("Given an Order", () {
    final order = emptyOrderOne;
    order.add(ball);
    order.add(bat);

    testWidgets("It should order number date and total price", (tester) async {
      final widget = ClosedOrderItemWidget(order);

      await tester.pumpWidget(MaterialApp(home: Scaffold(body: widget)));

      expect(find.text("#${order.id}"), findsOneWidget);
      expect(find.byType(DateTimeText), findsOneWidget);
      expect(find.byType(CurrencyText), findsOneWidget);
    });
  });
}
