import 'package:caderninho/domain/catalog/product.dart';
import 'package:equatable/equatable.dart';

class CartItem extends Equatable {
  final Product product;
  int quantity;

  CartItem(this.product, {this.quantity = 1});

  @override
  List<Object> get props => [product, quantity];
}
