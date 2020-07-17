import 'package:caderninho/presentation/page/new_order_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../navigator.dart';

class NewOrderFloatActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add_shopping_cart),
      onPressed: () => push(context, NewOrderPage()),
    );
  }
}
