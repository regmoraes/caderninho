import 'dart:collection';

import 'package:caderninho/catalog/catalog.dart';
import 'package:caderninho/catalog/product.dart';
import 'package:caderninho/catalog/search.dart';

import 'repository.dart';

class InMemoryCatalog implements CatalogRepository {
  final HashMap<int, Product> _products = HashMap();

  Catalog get _catalog => Catalog(_products.values.toList());

  @override
  Future<Catalog> addProduct(Product product) {
    _products[product.id] = product;
    return Future.value(_catalog);
  }

  @override
  Future<Catalog> fetchCatalog(CatalogSearch catalogSearch) {
    return Future.value(_catalog);
  }
}
