import 'package:intl/intl.dart';

final _formatter = NumberFormat.simpleCurrency(locale: "pt_Br");

String priceTextFrom(int priceInCents) => _formatter.format(priceInCents / 100);

int priceFrom(String input) {
  return int.parse(input
      .replaceFirst(_formatter.currencySymbol, "")
      .replaceAll(",", "")
      .replaceAll(".", ""));
}
