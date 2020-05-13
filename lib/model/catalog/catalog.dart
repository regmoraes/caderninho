import 'package:equatable/equatable.dart';

import 'product.dart';

class Catalog extends Equatable {
  final List<Product> _products;

  List<Product> get products => List.unmodifiable(_products);

  Catalog(this._products);

  @override
  List<Object> get props => [products];
}
