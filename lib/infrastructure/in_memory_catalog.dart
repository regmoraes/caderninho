import 'dart:collection';

import 'package:caderninho/domain/catalog/catalog.dart';
import 'package:caderninho/domain/catalog/catalog_repository.dart';
import 'package:caderninho/domain/catalog/product.dart';
import 'package:caderninho/domain/catalog/search.dart';

class InMemoryCatalog implements CatalogRepository {
  final HashMap<int, Product> products = HashMap();

  @override
  Future<bool> add(Product product) {
    products[product.id] = product;

    return Future.value(true);
  }

  @override
  Future<Catalog> fetch(CatalogSearch searchTerm) {
    final catalog =
        Catalog(products.entries.map((entry) => entry.value).toList());

    return Future.value(catalog);
  }
}
