import 'package:caderninho/widget/currency_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Given a Currency Field', () {
    CurrencyEditingController controller;
    CurrencyField currencyField;

    setUp(() {
      controller = CurrencyEditingController();
      currencyField = CurrencyField(controller: controller);
    });

    testWidgets('When inputting 1 and 0, It should show R\$ 0,10',
        (tester) async {
      await tester.pumpWidget(MaterialApp(home: Scaffold(body: currencyField)));

      await tester.enterText(find.byWidget(currencyField), "10");

      await tester.pump();

      expect(currencyField.controller.text, 'R\$\u00a00,10');
    });
  });
}
