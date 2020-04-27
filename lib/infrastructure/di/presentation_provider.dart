import 'package:caderninho/presentation/bloc/catalog_bloc.dart';

import 'application_provider.dart';

CatalogBloc _catalogBloc;

CatalogBloc get catalogBloc {
  if (_catalogBloc == null)
    _catalogBloc = CatalogBloc(fetchCatalog, addProduct);
  return _catalogBloc;
}
