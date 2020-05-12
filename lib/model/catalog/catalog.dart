import 'package:equatable/equatable.dart';

import 'product.dart';

class Catalog extends Equatable {
  final List<Product> products;

  Catalog(this.products);

  @override
  List<Object> get props => [products];
}
