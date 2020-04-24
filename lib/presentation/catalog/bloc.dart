import 'dart:async';

import 'package:caderninho/application/fetch_catalog.dart';
import 'package:caderninho/domain/catalog/search.dart';

import 'states.dart';

class CatalogBloc {
  final FetchCatalog _fetchCatalog;
  final _catalogStreamController = StreamController<CatalogState>();

  Stream<CatalogState> get catalogState => _catalogStreamController.stream;

  CatalogBloc(this._fetchCatalog);

  void fetchCatalog(CatalogSearch search) async {
    _catalogStreamController.add(Fetching());
    final fetchResult = await _fetchCatalog(null);
    _catalogStreamController.add(CatalogFetched(fetchResult));
  }

  void close() {
    _catalogStreamController.close();
  }
}
