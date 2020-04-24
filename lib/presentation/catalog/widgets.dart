import 'package:caderninho/domain/catalog/product.dart';
import 'package:flutter/material.dart';

import 'states.dart';

StreamBuilder buildCatalog(Stream<CatalogState> catalogStream) {
  return StreamBuilder(
    stream: catalogStream,
    initialData: Fetching,
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        switch (snapshot.data.runtimeType) {
          case CatalogFetched:
            return _onCatalogFetched(context, snapshot.data);
            break;

          default:
            return _onCatalogFetching();
            break;
        }
      } else {
        return _onCatalogFetching();
      }
    },
  );
}

Widget _onCatalogFetching() {
  return Center(child: CircularProgressIndicator());
}

Widget _onCatalogFetched(BuildContext context, CatalogFetched catalogFetched) {
  return _createCatalogWidget(context, catalogFetched);
}

Widget _createCatalogWidget(
    BuildContext context, CatalogFetched catalogFetched) {
  var size = MediaQuery.of(context).size;
  final double itemHeight = (size.height - 200) / 2;
  final double itemWidth = size.width / 2;

  final products = catalogFetched.catalog.products;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Expanded(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: itemWidth / itemHeight,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) =>
              _createProductItemWidget(context, products[index]),
        ),
      )
    ],
  );
}

Widget _createProductItemWidget(BuildContext context, Product product) {
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
