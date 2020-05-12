import 'package:caderninho/model/catalog/catalog.dart';
import 'package:caderninho/model/catalog/product.dart';
import 'package:caderninho/model/catalog/search.dart';

typedef Future<bool> AddProduct(Product product);
typedef Future<Catalog> FetchCatalog(CatalogSearch catalogSearch);
