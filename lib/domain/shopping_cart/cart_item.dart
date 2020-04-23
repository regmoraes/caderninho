import 'package:caderninho/domain/catalog/product.dart';
import 'package:equatable/equatable.dart';

class CartItem extends Equatable {
  final Product product;
  int quantity = 1;

  CartItem(this.product);

  @override
  List<Object> get props => [product];
}
