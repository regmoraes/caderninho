import 'package:caderninho/catalog/catalog.dart';
import 'package:caderninho/catalog/product.dart';
import 'package:caderninho/catalog/search.dart';

abstract class CatalogRepository {
  Future<Catalog> addProduct(Product product);

  Future<Catalog> fetchCatalog(CatalogSearch catalogSearch);
}
