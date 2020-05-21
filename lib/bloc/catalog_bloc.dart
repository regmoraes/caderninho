import 'dart:async';

import 'package:caderninho/infrastructure/catalog_repository.dart';
import 'package:caderninho/model/catalog/product.dart';
import 'package:caderninho/model/catalog/search.dart';

import 'catalog_states.dart';

class CatalogBloc {
  final CatalogRepository catalogRepository;

  final _catalogStreamController = StreamController<CatalogState>.broadcast();

  Stream<CatalogState> get state => _catalogStreamController.stream;

  CatalogBloc(this.catalogRepository);

  void fetchCatalog(CatalogSearch search) async {
    _catalogStreamController.add(Fetching());
    final fetchResult = await catalogRepository.fetchCatalog(search);
    _catalogStreamController.add(Fetched(fetchResult));
  }

  void addProduct(Product product) async {
    _catalogStreamController.add(AddingProduct());

    final updatedCatalog = await catalogRepository.addProduct(product);

    _catalogStreamController.add(ProductAdded(updatedCatalog));
  }
}
