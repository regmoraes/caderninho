import 'package:caderninho/bloc/cart_bloc.dart';
import 'package:caderninho/presentation/navigator.dart';
import 'package:caderninho/presentation/page/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {
            print("I was pressed");
            push(context, CartPage());
          },
        ),
        Consumer<ShoppingCartBloc>(builder: (context, cartBloc, _) {
          if (cartBloc.shoppingCart.isEmpty)
            return Container();
          else
            return Positioned(
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
                  "${cartBloc.shoppingCart.itemsCount}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 8,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            );
        }),
      ],
    );
  }
}
