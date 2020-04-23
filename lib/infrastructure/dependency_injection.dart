import 'package:caderninho/application/add_product_to_catalog.dart';
import 'package:caderninho/application/fetch_catalog.dart';
import 'package:caderninho/application/search_catalog.dart';
import 'package:caderninho/domain/catalog/catalog_repository.dart';
import 'package:caderninho/presentation/add_product/bloc.dart';
import 'package:caderninho/presentation/catalog/bloc.dart';

import 'in_memory_catalog.dart';

CatalogRepository _catalog = InMemoryCatalog();

SearchCatalog _searchCatalog;

SearchCatalog get searchCatalog {
  if (_searchCatalog == null) _searchCatalog = searchCatalogUseCase(_catalog);

  return _searchCatalog;
}

FetchCatalog _fetchCatalog;

FetchCatalog get fetchCatalog {
  if (_fetchCatalog == null) _fetchCatalog = fetchCatalogUseCase(_catalog);
  return _fetchCatalog;
}

CatalogBloc _catalogBloc;

CatalogBloc get catalogBloc {
  if (_catalogBloc == null) _catalogBloc = CatalogBloc(fetchCatalog);
  return _catalogBloc;
}

AddProductToCatalog _addProductToCatalog;

AddProductToCatalog get addProductToCatalog {
  if (_addProductToCatalog == null)
    _addProductToCatalog = addProductToCatalogUseCase(_catalog);
  return _addProductToCatalog;
}

AddProductBloc _addProductBloc;

AddProductBloc get addProductToCatalogBloc {
  if (_addProductBloc == null)
    _addProductBloc = AddProductBloc(addProductToCatalog);
  return _addProductBloc;
}
