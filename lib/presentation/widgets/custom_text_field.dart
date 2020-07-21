import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const CustomTextField({this.hintText, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderSide: BorderSide()),
        contentPadding: EdgeInsets.all(8),
        hintStyle: TextStyle(fontSize: 17),
        hintText: hintText,
      ),
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.sentences,
    );
  }
}
