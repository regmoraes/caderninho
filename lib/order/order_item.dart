import 'package:caderninho/catalog/product.dart';
import 'package:equatable/equatable.dart';

class OrderItem extends Equatable {
  final Product product;
  int quantity;

  OrderItem(this.product, {this.quantity = 1});

  int get totalPrice => product.priceInCents * quantity;

  @override
  List<Object> get props => [product, quantity];
}
