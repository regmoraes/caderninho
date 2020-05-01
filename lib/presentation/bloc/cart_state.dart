import 'package:caderninho/domain/shopping_cart/cart_item.dart';
import 'package:equatable/equatable.dart';

abstract class CartState extends Equatable {
  final List<CartItem> cartItems;
  final int itemsCount;
  final int totalPrice;

  CartState(this.cartItems, this.itemsCount, this.totalPrice);

  @override
  List<Object> get props => [cartItems, itemsCount, totalPrice];
}

class ItemAdded extends CartState {
  ItemAdded({cartItems, itemsCount, totalPrice})
      : super(cartItems, itemsCount, totalPrice);
}

class ItemRemoved extends CartState {
  ItemRemoved({cartItems, itemsCount, totalPrice})
      : super(cartItems, itemsCount, totalPrice);
}

class Empty extends CartState {
  Empty() : super(List(), 0, 0);
}
