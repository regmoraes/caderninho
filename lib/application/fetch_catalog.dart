import 'package:caderninho/domain/catalog/catalog.dart';
import 'package:caderninho/domain/catalog/catalog_repository.dart';
import 'package:caderninho/domain/catalog/search.dart';

typedef Future<Catalog> FetchCatalog(CatalogSearch search);

FetchCatalog fetchCatalogUseCase(CatalogRepository catalog) {
  return (searchTerm) => catalog.fetch(searchTerm);
}
