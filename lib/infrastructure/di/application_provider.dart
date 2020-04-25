import 'package:caderninho/application/add_product.dart';
import 'package:caderninho/application/fetch_catalog.dart';

import '../in_memory_catalog.dart';

AddProduct _addProduct;

AddProduct get addProduct {
  if (_addProduct == null)
    _addProduct = InMemoryCatalog.addProduct;
  return _addProduct;
}

FetchCatalog _fetchCatalog;

FetchCatalog get fetchCatalog {
  if (_fetchCatalog == null)
    _fetchCatalog = InMemoryCatalog.fetch;
  return _fetchCatalog;
}
