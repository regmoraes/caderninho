import 'dart:io';

import 'package:caderninho/catalog/product.dart';
import 'package:caderninho/order/bloc/order_bloc.dart';
import 'package:caderninho/order/bloc/order_state.dart';
import 'package:caderninho/order/widget/add_to_order_button.dart';
import 'package:caderninho/widget/currency_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            BlocBuilder<OrderBloc, OrderState>(
              builder: (_, state) => state is OrderUpdated
                  ? AddToCartButton(product)
                  : Container(),
            )
          ],
        ),
      ),
    );
  }
}
