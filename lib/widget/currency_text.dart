import 'package:caderninho/widget/currency_formatter.dart';
import 'package:flutter/widgets.dart';

class CurrencyText extends Text {
  CurrencyText(int priceInCents, {TextStyle style})
      : super(
    "${priceTextFrom(priceInCents)}",
    textAlign: TextAlign.center,
    style: style,
  );
}
