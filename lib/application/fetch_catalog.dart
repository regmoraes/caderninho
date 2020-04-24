import 'package:caderninho/domain/catalog/catalog.dart';
import 'package:caderninho/domain/catalog/search.dart';

typedef Future<Catalog> FetchCatalog(CatalogSearch search);
