import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../button_style.dart' as ButtonStyle;

class OkButton extends StatelessWidget {
  final void Function() onPressed;

  OkButton([this.onPressed]);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(8),
        child: Align(
          alignment: Alignment.bottomRight,
          child: RaisedButton(
            child: Text("Adicionar"),
            color: ButtonStyle.backgroundColor,
            textColor: ButtonStyle.textColor,
            onPressed: () => onPressed?.call(),
          ),
        ),
      ),
    );
  }
}
