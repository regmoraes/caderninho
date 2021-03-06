import 'package:caderninho/catalog/catalog.dart';
import 'package:caderninho/catalog/product.dart';
import 'package:flutter/material.dart';

import 'catalog_item.dart';

typedef void OnProductClicked(Product product);

class CatalogWidget extends StatelessWidget {
  final Catalog catalog;

  CatalogWidget(this.catalog);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double itemHeight = (size.height * 0.45);
    final double itemWidth = size.width / 2;

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: itemWidth / itemHeight,
      ),
      itemCount: catalog.products.length,
      itemBuilder: (context, index) =>
          CatalogItem(product: catalog.products[index]),
    );
  }
}
