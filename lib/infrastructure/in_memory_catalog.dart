import 'dart:collection';

import 'package:caderninho/model/catalog/catalog.dart';
import 'package:caderninho/model/catalog/product.dart';
import 'package:caderninho/model/catalog/search.dart';

import 'catalog_repository.dart';

class InMemoryCatalog implements CatalogRepository {
  final HashMap<int, Product> _products = HashMap();

  @override
  Future<bool> addProduct(Product product) {
    _products[product.id] = product;
    return Future.value(true);
  }

  @override
  Future<Catalog> fetchCatalog(CatalogSearch catalogSearch) {
    final catalog =
        Catalog(_products.entries.map((entry) => entry.value).toList());
    return Future.value(catalog);
  }
}
