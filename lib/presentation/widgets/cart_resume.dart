import 'package:caderninho/presentation/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartResume extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartBloc>(
      builder: (context, cartBloc, _) => BottomAppBar(
        color: Colors.blue,
        child: Text(
          "Total price: \$${cartBloc.totalPrice}",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
