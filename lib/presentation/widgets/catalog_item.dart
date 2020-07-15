import 'package:caderninho/bloc/order_bloc.dart';
import 'package:caderninho/model/catalog/product.dart';
import 'package:caderninho/presentation/currency_formatter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

typedef void OnItemClicked(Product product);

class CatalogItem extends StatelessWidget {
  final bool showAddToCartOption;
  final OnItemClicked onItemClicked;
  final Product product;

  CatalogItem({this.product, this.showAddToCartOption, this.onItemClicked});

  @override
  Widget build(BuildContext context) {
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
              "${priceTextFrom(product.priceInCents)}",
              textAlign: TextAlign.center,
            )),
            AddToCartButton(product)
          ],
        ),
      ),
    );
  }
}

class AddToCartButton extends StatelessWidget {
  final Product product;

  AddToCartButton(this.product);

  @override
  Widget build(BuildContext context) {
    final orderBloc = Provider.of<OrderBloc>(context);
    if (orderBloc.hasOngoingOrder) {
      return RaisedButton(
          child: Text("Add to Cart"),
          onPressed: () => orderBloc.addProduct(product));
    } else {
      return Container();
    }
  }
}
