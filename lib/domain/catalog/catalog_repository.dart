import 'catalog.dart';
import 'product.dart';
import 'search.dart';

abstract class CatalogRepository {
  Future<bool> add(Product product);

  Future<Catalog> fetch(CatalogSearch searchTerm);
}
