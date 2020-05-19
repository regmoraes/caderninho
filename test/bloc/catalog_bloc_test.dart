import 'package:caderninho/bloc/catalog_bloc.dart';
import 'package:caderninho/bloc/catalog_states.dart';
import 'package:caderninho/model/catalog/catalog.dart';
import 'package:caderninho/model/catalog/search.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../infrastructure/catalog_mock.dart';
import '../test_stubs.dart';

void main() {
  CatalogRepositoryMock catalogRepositoryMock;
  CatalogBloc catalogBloc;

  group("Given a Catalog", () {
    final catalog = Catalog([ball, bat]);

    setUp(() {
      catalogRepositoryMock = CatalogRepositoryMock();
      catalogBloc = CatalogBloc(catalogRepositoryMock);
      when(catalogRepositoryMock.addProduct(any))
          .thenAnswer((_) => Future.value(true));
    });

    test("When fetching catalog it should emit correct stream of states",
        () async {
      when(catalogRepositoryMock.fetchCatalog(any))
          .thenAnswer((_) => Future.value(catalog));

      final expectedStates = {Fetching(), Fetched(catalog)};

          expectLater(catalogBloc.state, emitsInOrder(expectedStates));

          catalogBloc.fetchCatalog(FetchAll());
        });

    test(
        "When adding product it should emit correct stream of states if its successful",
            () async {
          when(catalogRepositoryMock.addProduct(any))
              .thenAnswer((_) => Future.value(true));

          final expectedStates = {AddingProduct(), ProductAdded()};

          expectLater(catalogBloc.state, emitsInOrder(expectedStates));

          catalogBloc.addProduct(ball);
        });

    test(
        "When adding product it should emit correct stream of states if has error",
            () async {
          when(catalogRepositoryMock.addProduct(any))
              .thenAnswer((_) => Future.value(false));

          final expectedStates = {AddingProduct(), ErrorWhileAdding()};

          expectLater(catalogBloc.state, emitsInOrder(expectedStates));

          catalogBloc.addProduct(ball);
        });
  });
}
