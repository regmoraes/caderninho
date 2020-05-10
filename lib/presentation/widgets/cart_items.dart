import 'package:caderninho/domain/catalog/product.dart';
import 'package:caderninho/presentation/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItemsWidget extends StatelessWidget {
  final CartBloc _cartBloc;

  CartItemsWidget(this._cartBloc);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - 200) / 2;
    final double itemWidth = size.width / 2;

    return Consumer(
      builder: (context, cartBloc, child) {
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: itemWidth / itemHeight,
          ),
          itemCount: cartBloc.cartItems.length,
          itemBuilder: (context, index) =>
              _cartItem(context, cartBloc.cartItems[index].product),
        );
      },
    );
  }

  Widget _cartItem(BuildContext context, Product product) {
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
              "${product.name}",
              textAlign: TextAlign.center,
            )),
            Container(
                child: Text(
              "\$ ${product.price}",
              textAlign: TextAlign.center,
            )),
          ],
        ),
      ),
    );
  }

  Widget _emptyCartText() {
    return Center(child: Text("Your cart is empty"));
  }
}
