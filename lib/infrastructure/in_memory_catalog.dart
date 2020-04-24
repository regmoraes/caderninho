import 'dart:collection';

import 'package:caderninho/application/add_product_to_catalog.dart';
import 'package:caderninho/application/fetch_catalog.dart';
import 'package:caderninho/domain/catalog/catalog.dart';
import 'package:caderninho/domain/catalog/product.dart';
import 'package:caderninho/domain/catalog/search.dart';

class InMemoryCatalog {
  static final HashMap<int, Product> _products = HashMap();

  static final AddProductToCatalog addToInMemoryCatalog = (product) {
    _products[product.id] = product;
    return Future.value(true);
  };

  static final FetchCatalog fetchInMemoryCatalog = (CatalogSearch searchTerm) {
    final catalog =
    Catalog(_products.entries.map((entry) => entry.value).toList());
    return Future.value(catalog);
  };
}
