import 'package:caderninho/presentation/bloc/cart_bloc.dart';
import 'package:caderninho/presentation/bloc/cart_state.dart';
import 'package:flutter/material.dart';

class CartWidget extends StatelessWidget {
  final CartBloc _cartBloc;

  CartWidget(this._cartBloc);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _cartBloc.state,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final cartState = snapshot.data as CartState;

          return Stack(
            children: <Widget>[
              Icon(Icons.shopping_cart),
              Positioned(
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 12,
                    minHeight: 12,
                  ),
                  child: Text(
                    "${cartState.itemsCount}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          );
        } else {
          return Icon(Icons.shopping_cart);
        }
      },
    );
  }
}
