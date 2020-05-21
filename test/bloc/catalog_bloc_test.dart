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
    setUp(() {
      catalogRepositoryMock = CatalogRepositoryMock();
      catalogBloc = CatalogBloc(catalogRepositoryMock);
    });

    test("When fetching catalog it should emit correct stream of states",
        () async {
      final expectedCatalog = Catalog([ball, bat]);

      when(catalogRepositoryMock.fetchCatalog(any))
              .thenAnswer((_) => Future.value(expectedCatalog));

          final expectedStates = {Fetching(), Fetched(expectedCatalog)};

          expectLater(catalogBloc.state, emitsInOrder(expectedStates));

          catalogBloc.fetchCatalog(FetchAll());
        });

    test(
        "When adding product it should emit correct stream of states if its successful",
            () async {
          final expectedCatalog = Catalog([ball, bat, ball]);

          when(catalogRepositoryMock.addProduct(any))
              .thenAnswer((_) => Future.value(expectedCatalog));

          final expectedStates = [
            AddingProduct(),
            ProductAdded(expectedCatalog)
          ];

          expectLater(catalogBloc.state, emitsInOrder(expectedStates));

          catalogBloc.addProduct(ball);
        });
  });
}
