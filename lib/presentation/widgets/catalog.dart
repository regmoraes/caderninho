import 'package:caderninho/model/catalog/catalog.dart';
import 'package:caderninho/model/catalog/product.dart';
import 'package:flutter/material.dart';

typedef void OnProductClicked(Product product);

class CatalogWidget extends StatelessWidget {
  final Catalog catalog;
  final bool hasOngoingOrder;
  final OnProductClicked callback;

  CatalogWidget(this.catalog, [this.hasOngoingOrder = false, this.callback]);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - 200) / 2;
    final double itemWidth = size.width / 2;

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: itemWidth / itemHeight,
      ),
      itemCount: catalog.products.length,
      itemBuilder: (context, index) =>
          _productItem(context, catalog.products[index]),
    );
  }

  Widget _productItem(BuildContext context, Product product) {
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
            buildAddToOrderButtonIfNeeded(hasOngoingOrder, product)
          ],
        ),
      ),
    );
  }

  Widget buildAddToOrderButtonIfNeeded(bool hasOngoingOrder, Product product) {
    if (hasOngoingOrder) {
      return RaisedButton(
        child: Text("Add to Cart"),
        onPressed: () {
          if (callback != null) callback(product);
        },
      );
    } else {
      return Container();
    }
  }
}
