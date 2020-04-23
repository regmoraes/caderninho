import 'package:caderninho/domain/catalog/catalog_repository.dart';
import 'package:caderninho/domain/catalog/product.dart';

typedef Future<List<Product>> SearchCatalog(String searchTerm);

SearchCatalog searchCatalogUseCase(CatalogRepository catalogRepository) {
  return (searchTerm) => Future.value(List());
}
