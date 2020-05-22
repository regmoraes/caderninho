import 'package:caderninho/model/customer/customer.dart';
import 'package:caderninho/presentation/widgets/customers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Given an empty Customer list", () {
    final customersResult = List<Customer>();

    testWidgets("It shouldn't show any customer", (tester) async {
      final customersWidget = CustomersWidget(customersResult);

      await tester
          .pumpWidget(MaterialApp(home: Scaffold(body: customersWidget)));

      expect(find.byWidget(customersWidget), findsOneWidget);
      expect(find.byType(Text), findsNothing);
      expect(find.byType(Icon), findsNothing);
    });
  });

  group("Given a non empty Customer list", () {
    final customerOne = Customer(id: 1, name: "A customer");
    final customerTwo = Customer(id: 2, name: "Another customer");

    final customers = [customerOne, customerTwo];

    testWidgets("It should show customer name", (tester) async {
      final customersWidget = CustomersWidget(customers);

      await tester
          .pumpWidget(MaterialApp(home: Scaffold(body: customersWidget)));

      expect(find.byType(ListTile), findsNWidgets(2));
      expect(find.text("${customerOne.name}"), findsNWidgets(1));
      expect(find.text("${customerTwo.name}"), findsNWidgets(1));
    });
  });
}
