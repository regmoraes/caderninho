import 'dart:async';

import 'package:caderninho/application/add_product.dart';
import 'package:caderninho/domain/catalog/product.dart';

import 'states.dart';

class AddProductBloc {
  final AddProduct _addProduct;
  final _addProductStreamController = StreamController<AddProductState>();

  Stream<AddProductState> get addProductState =>
      _addProductStreamController.stream;

  AddProductBloc(this._addProduct);

  void addProductToCatalog(Product product) async {
    _addProductStreamController.add(AddingProduct());

    final addSuccessful = await _addProduct(product);

    if (addSuccessful)
      _addProductStreamController.add(ProductAdded());
    else
      _addProductStreamController.add(ErrorWhileAdding());
  }

  void close() {
    _addProductStreamController.close();
  }
}
