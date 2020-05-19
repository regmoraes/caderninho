import 'package:caderninho/model/catalog/product.dart';
import 'package:equatable/equatable.dart';

class OrderItem extends Equatable {
  final Product product;
  int quantity;

  OrderItem(this.product, {this.quantity = 1});

  @override
  List<Object> get props => [product, quantity];
}
