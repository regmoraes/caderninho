import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Future push(BuildContext context, Widget page, {bool replace = false}) {
  final route = MaterialPageRoute(builder: (buildContext) => page);

  if (replace)
    return Navigator.pushReplacement(context, route);
  else
    return Navigator.push(context, route);
}

bool pop<T extends Object>(BuildContext context, [T result]) {
  if (Navigator.canPop(context)) {
    Navigator.pop(context, result);
    return true;
  }
  return false;
}
