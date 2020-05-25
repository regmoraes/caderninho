import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
            child: Text("Ok"),
            onPressed: () => onPressed?.call(),
          ),
        ),
      ),
    );
  }
}
