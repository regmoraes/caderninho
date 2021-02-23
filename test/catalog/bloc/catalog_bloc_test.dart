import 'package:caderninho/catalog/bloc/bloc.dart';
import 'package:caderninho/catalog/bloc/state.dart';
import 'package:caderninho/catalog/catalog.dart';
import 'package:caderninho/catalog/search.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../test_stubs.dart';
import '../catalog_mock.dart';


void main() {
  CatalogRepositoryMock catalogRepositoryMock;
  CatalogBloc catalogBloc;

  group("Given a Catalog", () {
    setUp(() {
      catalogRepositoryMock = CatalogRepositoryMock();
      catalogBloc = CatalogBloc(catalogRepositoryMock);
    });

    test("When fetching catalog It should emit correct stream of states",
        () async {
      final expectedCatalog = Catalog([ball, bat]);

      when(catalogRepositoryMock.fetchCatalog(any))
              .thenAnswer((_) => Future.value(expectedCatalog));

          final expectedStates = {Fetching(), Fetched(expectedCatalog)};

          expectLater(catalogBloc.state, emitsInOrder(expectedStates));

          catalogBloc.fetchCatalog(FetchAll());
        });

    test(
        "When adding product It should emit correct stream of states if its successful",
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
