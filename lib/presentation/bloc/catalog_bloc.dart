import 'dart:async';

import 'package:caderninho/application/add_product.dart';
import 'package:caderninho/application/fetch_catalog.dart';
import 'package:caderninho/domain/catalog/product.dart';
import 'package:caderninho/domain/catalog/search.dart';

import 'catalog_states.dart';

class CatalogBloc {
  final FetchCatalog _fetchCatalog;
  final AddProduct _addProduct;

  final _catalogStreamController = StreamController<CatalogState>.broadcast();

  Stream<CatalogState> get state => _catalogStreamController.stream;

  CatalogBloc(this._fetchCatalog, this._addProduct);

  void fetchCatalog(CatalogSearch search) async {
    _catalogStreamController.add(Fetching());
    final fetchResult = await _fetchCatalog(search);
    _catalogStreamController.add(Fetched(fetchResult));
  }

  void addProductToCatalog(Product product) async {
    _catalogStreamController.add(AddingProduct());

    final addSuccessful = await _addProduct(product);

    if (addSuccessful)
      _catalogStreamController.add(ProductAdded());
    else
      _catalogStreamController.add(ErrorWhileAdding());
  }
}
