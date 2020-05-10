import 'dart:async';

import 'package:caderninho/domain/catalog/catalog.dart';
import 'package:caderninho/domain/catalog/product.dart';
import 'package:caderninho/domain/catalog/search.dart';
import 'package:caderninho/presentation/bloc/catalog_bloc.dart';
import 'package:caderninho/presentation/bloc/catalog_states.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Given a Catalog", () {
    final ball = Product(id: 1, name: "Ball", description: "Ball", price: 100);
    final bat = Product(id: 2, name: "Bat", description: "Bat", price: 500);
    final catalog = Catalog([ball, bat]);

    test(
        "When fetching catalog it should emit correct stream of states", () async {
      final fetchCatalog = (catalogSearch) => Future.value(catalog);
      final addProduct = (product) => Future.value(true);
      final catalogBloc = CatalogBloc(fetchCatalog, addProduct);

      final expectedStates = {Fetching(), Fetched(catalog)};

      expectLater(catalogBloc.state, emitsInOrder(expectedStates));

      catalogBloc.fetchCatalog(EmptySearch());
    });

    test(
        "When adding product it should emit correct stream of states if its successful",
        () async {
      final fetchCatalog = (catalogSearch) => Future.value(catalog);
      final addProduct = (product) => Future.value(true);
      final catalogBloc = CatalogBloc(fetchCatalog, addProduct);

      final expectedStates = {AddingProduct(), ProductAdded()};

      expectLater(catalogBloc.state, emitsInOrder(expectedStates));

      catalogBloc.addProductToCatalog(ball);
    });

    test(
        "When adding product it should emit correct stream of states if has error",
        () async {
      final fetchCatalog = (catalogSearch) => Future.value(catalog);
      final addProduct = (product) => Future.value(false);
      final catalogBloc = CatalogBloc(fetchCatalog, addProduct);

      final expectedStates = {AddingProduct(), ErrorWhileAdding()};

      expectLater(catalogBloc.state, emitsInOrder(expectedStates));

      catalogBloc.addProductToCatalog(ball);
    });
  });
}
