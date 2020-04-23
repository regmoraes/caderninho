import 'dart:async';

import 'package:caderninho/domain/catalog/product.dart';
import 'package:caderninho/presentation/add_product/bloc.dart';
import 'package:caderninho/presentation/add_product/states.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final ball = Product(id: 1, name: "Ball", description: "A ball", price: 100);

  group("Given an AddProductBloc", () {
    test(
        "When adding product it should emit correct stream of states if its successful",
        () async {
      final addProductToCatalog = (Product product) => Future.value(true);

      final addProductBloc = AddProductBloc(addProductToCatalog);

      final expectedStates = {AddingProduct(), ProductAdded()};

      expectLater(addProductBloc.addProductState, emitsInOrder(expectedStates));

      addProductBloc.addProductToCatalog(ball);
    });

    test(
        "When adding product it should emit correct stream of states if has error",
        () async {
      final addProductToCatalog = (Product product) => Future.value(false);

      final addProductBloc = AddProductBloc(addProductToCatalog);

      final expectedStates = {AddingProduct(), ErrorWhileAdding()};

      expectLater(addProductBloc.addProductState, emitsInOrder(expectedStates));

      addProductBloc.addProductToCatalog(ball);
    });
  });
}
