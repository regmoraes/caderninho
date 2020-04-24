import 'package:caderninho/presentation/add_product/bloc.dart';
import 'package:caderninho/presentation/catalog/bloc.dart';

import 'application_provider.dart';

AddProductBloc _addProductToCatalogBloc;

AddProductBloc get addProductToCatalogBloc {
  if (_addProductToCatalogBloc == null)
    _addProductToCatalogBloc = AddProductBloc(addProductToCatalog);
  return _addProductToCatalogBloc;
}

CatalogBloc _catalogBloc;

CatalogBloc get catalogBloc {
  if (_catalogBloc == null) _catalogBloc = CatalogBloc(fetchCatalog);
  return _catalogBloc;
}
