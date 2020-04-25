import 'dart:collection';

import 'package:caderninho/application/add_product.dart';
import 'package:caderninho/application/fetch_catalog.dart';
import 'package:caderninho/domain/catalog/catalog.dart';
import 'package:caderninho/domain/catalog/product.dart';
import 'package:caderninho/domain/catalog/search.dart';

class InMemoryCatalog {
  static final HashMap<int, Product> _products = HashMap();

  static final AddProduct addProduct = (product) {
    _products[product.id] = product;
    return Future.value(true);
  };

  static final FetchCatalog fetch = (CatalogSearch searchTerm) {
    final catalog =
    Catalog(_products.entries.map((entry) => entry.value).toList());
    return Future.value(catalog);
  };
}
