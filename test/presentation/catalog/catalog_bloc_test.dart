import 'dart:async';

import 'package:caderninho/domain/catalog/catalog.dart';
import 'package:caderninho/domain/catalog/product.dart';
import 'package:caderninho/domain/catalog/search.dart';
import 'package:caderninho/presentation/catalog/bloc.dart';
import 'package:caderninho/presentation/catalog/states.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Given a CatalogBloc", () {
    final _products = List<Product>();
    final _catalog = Catalog(_products);
    final _fetchCatalog =
        (CatalogSearch catalogSearch) => Future.value(_catalog);
    CatalogBloc _catalogBloc;

    setUp(() {
      _catalogBloc = CatalogBloc(_fetchCatalog);
    });

    tearDown(() {
      _catalogBloc.close();
    });

    test("When fetchCatalog it should emit correct stream of states", () async {
      final expectedStates = {Fetching(), CatalogFetched(_catalog)};

      expectLater(_catalogBloc.catalogState, emitsInOrder(expectedStates));

      _catalogBloc.fetchCatalog(EmptySearch());
    });
  });
}
