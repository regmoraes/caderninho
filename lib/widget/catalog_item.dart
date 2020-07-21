import 'dart:io';

import 'package:caderninho/catalog/product.dart';
import 'package:caderninho/order/bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'add_to_cart_button.dart';
import 'currency_text.dart';

typedef void OnItemClicked(Product product);

class CatalogItem extends StatelessWidget {
  final Product product;

  CatalogItem({this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: EdgeInsets.all(8),
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Image.file(
              File(product.imagePath),
              filterQuality: FilterQuality.medium,
            ),
            Text(
              "${product.name}",
              textAlign: TextAlign.center,
            ),
            CurrencyText(product.priceInCents),
            context.watch<OrderBloc>().hasOngoingOrder
                ? AddToCartButton(product)
                : Container()
          ],
        ),
      ),
    );
  }
}
