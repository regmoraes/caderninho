import 'package:caderninho/order/bloc.dart';
import 'package:caderninho/order/in_memory_repository.dart';
import 'package:caderninho/order/order_type.dart';
import 'package:caderninho/order/widget/order_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import '../../test_stubs.dart';

void main() {
  OrderBloc _orderBloc;

  setUp(() {
    _orderBloc = OrderBloc(InMemoryOrder());
    _orderBloc.newOrder(testerCustomer, OrderType.CASH);
  });

  group("Given an empty Order", () {
    testWidgets("It shouldn't show any badges on icon", (tester) async {
      final orderIcon = OrderIcon();

      await tester.pumpWidget(
        ChangeNotifierProvider(
            create: (_) => _orderBloc,
            child: MaterialApp(home: Scaffold(body: orderIcon))),
      );

      expect(find.byWidget(orderIcon), findsOneWidget);
      expect(find.byType(Text), findsNothing);
    });
  });

  group("Given a non empty Order", () {
    testWidgets("It should show item count", (tester) async {
      final cartIcon = OrderIcon();

      await tester.pumpWidget(
        ChangeNotifierProvider.value(
            value: _orderBloc,
            child: MaterialApp(home: Scaffold(body: cartIcon))),
      );

      _orderBloc.addProduct(ball);
      _orderBloc.addProduct(ball);

      await tester.idle();
      await tester.pump(Duration.zero);

      expect(find.byWidget(cartIcon), findsOneWidget);
      expect(find.text("2"), findsOneWidget);
    });
  });
}
