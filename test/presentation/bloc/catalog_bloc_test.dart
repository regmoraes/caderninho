import 'dart:async';

import 'package:caderninho/bloc/catalog_bloc.dart';
import 'package:caderninho/bloc/catalog_states.dart';
import 'package:caderninho/model/catalog/catalog.dart';
import 'package:caderninho/model/catalog/product.dart';
import 'package:caderninho/model/catalog/search.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../infrastructure/catalog_mock.dart';

void main() {
  CatalogRepositoryMock catalogRepositoryMock;

  group("Given a Catalog", () {
    final ball = Product(id: 1, name: "Ball", description: "Ball", price: 100);
    final bat = Product(id: 2, name: "Bat", description: "Bat", price: 500);
    final catalog = Catalog([ball, bat]);

    setUp(() {
      catalogRepositoryMock = CatalogRepositoryMock();
      when(catalogRepositoryMock.addProductToCatalog(any))
          .thenReturn(Future.value(true));
    });

    test("When fetching catalog it should emit correct stream of states",
            () async {
      when(catalogRepositoryMock.fetchCatalog(EmptySearch()))
          .thenAnswer((_) => Future.value(catalog));
      final catalogBloc = CatalogBloc(CatalogRepositoryMock());

      final expectedStates = {Fetching(), Fetched(catalog)};

          expectLater(catalogBloc.state, emitsInOrder(expectedStates));

          catalogBloc.fetchCatalog(EmptySearch());
        });

    test(
        "When adding product it should emit correct stream of states if its successful",
            () async {
          when(catalogRepositoryMock.addProductToCatalog(any))
              .thenAnswer((_) => Future.value(true));

          final catalogBloc = CatalogBloc(catalogRepositoryMock);

          final expectedStates = {AddingProduct(), ProductAdded()};

          expectLater(catalogBloc.state, emitsInOrder(expectedStates));

          catalogBloc.addProductToCatalog(ball);
        });

    test(
        "When adding product it should emit correct stream of states if has error",
            () async {
          when(catalogRepositoryMock.addProductToCatalog(any))
              .thenAnswer((_) => Future.value(true));

          final catalogBloc = CatalogBloc(catalogRepositoryMock);

          final expectedStates = {AddingProduct(), ErrorWhileAdding()};

          expectLater(catalogBloc.state, emitsInOrder(expectedStates));

          catalogBloc.addProductToCatalog(ball);
        });
  });
}
