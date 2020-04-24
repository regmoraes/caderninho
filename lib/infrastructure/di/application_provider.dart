import 'package:caderninho/application/add_product_to_catalog.dart';
import 'package:caderninho/application/fetch_catalog.dart';

import '../in_memory_catalog.dart';

AddProductToCatalog _addProductToCatalog;

AddProductToCatalog get addProductToCatalog {
  if (_addProductToCatalog == null)
    _addProductToCatalog = InMemoryCatalog.addToInMemoryCatalog;
  return _addProductToCatalog;
}

FetchCatalog _fetchCatalog;

FetchCatalog get fetchCatalog {
  if (_fetchCatalog == null)
    _fetchCatalog = InMemoryCatalog.fetchInMemoryCatalog;
  return _fetchCatalog;
}
