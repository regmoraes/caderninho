import 'package:caderninho/model/catalog/catalog.dart';
import 'package:caderninho/model/catalog/product.dart';
import 'package:caderninho/model/catalog/search.dart';

abstract class CatalogRepository {
  Future<bool> addProduct(Product product);

  Future<Catalog> fetchCatalog(CatalogSearch catalogSearch);
}
