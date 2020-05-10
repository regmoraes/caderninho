import 'package:caderninho/domain/cart/cart_item.dart';
import 'package:caderninho/presentation/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItemsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - 200) / 2;
    final double itemWidth = size.width / 2;

    return Consumer<CartBloc>(
      builder: (context, cartBloc, child) {
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: itemWidth / itemHeight,
          ),
          itemCount: cartBloc.cartItems.length,
          itemBuilder: (context, index) =>
              _cartItem(context, cartBloc.cartItems[index]),
        );
      },
    );
  }

  Widget _cartItem(BuildContext context, CartItem cartItem) {
    return GestureDetector(
      child: Card(
        clipBehavior: null,
        margin: EdgeInsets.all(8),
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
                child: Text(
              "${cartItem.product.name}",
              textAlign: TextAlign.center,
            )),
            Container(
                child: Text(
              "\$ ${cartItem.product.price}",
              textAlign: TextAlign.center,
            )),
            Container(
                child: Text(
              "Quantity: ${cartItem.quantity}",
              textAlign: TextAlign.center,
            )),
            Consumer<CartBloc>(
              builder: (context, cartBloc, _) => RaisedButton(
                child: Text("Remover"),
                onPressed: () => cartBloc.remove(cartItem.product.id),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
