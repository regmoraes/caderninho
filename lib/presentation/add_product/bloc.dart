import 'dart:async';

import 'package:caderninho/application/add_product_to_catalog.dart';
import 'package:caderninho/domain/catalog/product.dart';
import 'package:caderninho/presentation/add_product/states.dart';

class AddProductBloc {
  final AddProductToCatalog _addProductToCatalog;
  final _addProductStreamController = StreamController<AddProductState>();

  Stream<AddProductState> get addProductState =>
      _addProductStreamController.stream;

  AddProductBloc(this._addProductToCatalog);

  void addProductToCatalog(Product product) async {
    _addProductStreamController.add(AddingProduct());

    final addSuccessful = await _addProductToCatalog(product);

    if (addSuccessful)
      _addProductStreamController.add(ProductAdded());
    else
      _addProductStreamController.add(ErrorWhileAdding());
  }

  void close() {
    _addProductStreamController.close();
  }
}
