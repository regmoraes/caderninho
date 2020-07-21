import 'package:caderninho/widget/currency_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class CurrencyField extends StatelessWidget {
  final CurrencyEditingController controller;
  final String hintText;

  CurrencyField({this.hintText, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintStyle: TextStyle(fontSize: 17),
        hintText: hintText,
        border: OutlineInputBorder(borderSide: BorderSide()),
        contentPadding: EdgeInsets.all(8),
      ),
      inputFormatters: [CurrencyInputFormatter()],
      keyboardType: TextInputType.number,
      controller: controller,
      onChanged: (newText) => controller._cents = priceFrom(newText),
    );
  }
}

class CurrencyEditingController extends TextEditingController {
  int _cents = 0;

  int get cents => _cents;
}

class CurrencyInputFormatter extends TextInputFormatter {
  TextEditingValue formatEditUpdate(oldValue, newValue) {
    final _cents = priceFrom(newValue.text);
    final formattedText = priceTextFrom(_cents);
    return TextEditingValue(
        text: formattedText,
        selection: TextSelection.collapsed(offset: formattedText.length));
  }
}
