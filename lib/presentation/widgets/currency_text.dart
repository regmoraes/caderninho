import 'package:flutter/widgets.dart';

import '../currency_formatter.dart';

class CurrencyText extends Text {
  CurrencyText(int priceInCents, {TextStyle style})
      : super(
          "${priceTextFrom(priceInCents)}",
          textAlign: TextAlign.center,
          style: style,
        );
}
