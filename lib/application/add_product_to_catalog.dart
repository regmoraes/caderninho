import 'package:caderninho/domain/catalog/catalog_repository.dart';
import 'package:caderninho/domain/catalog/product.dart';

typedef Future<bool> AddProductToCatalog(Product product);

AddProductToCatalog addProductToCatalogUseCase(CatalogRepository catalog) {
  return (product) => catalog.add(product);
}
