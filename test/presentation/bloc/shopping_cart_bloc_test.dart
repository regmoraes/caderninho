import 'package:caderninho/domain/catalog/product.dart';
import 'package:caderninho/domain/shopping_cart/cart_item.dart';
import 'package:caderninho/presentation/bloc/cart_bloc.dart';
import 'package:caderninho/presentation/bloc/cart_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  CartBloc shoppingCartBloc;

  final ball = Product(id: 1, name: "Ball", description: "A ball", price: 100);
  final bat =
      Product(id: 2, name: "Bat", description: "A baseball bat", price: 500);

  group('Given an empty Shopping Cart', () {
    setUp(() {
      shoppingCartBloc = CartBloc();
    });

    test("When adding products it should emit ItemAdded", () {
      final expectedStates = [
        ItemAdded(
            cartItems: [CartItem(ball, quantity: 1)],
            itemsCount: 1,
            totalPrice: ball.price),
        ItemAdded(cartItems: [
          CartItem(ball, quantity: 1),
          CartItem(bat, quantity: 1)
        ], itemsCount: 2, totalPrice: ball.price + bat.price)
      ];

      expectLater(shoppingCartBloc.state, emitsInOrder(expectedStates));

      shoppingCartBloc.add(ball);
      shoppingCartBloc.add(bat);
    });
  });

  group('Given a non empty Shopping Cart', () {
    setUp(() {
      shoppingCartBloc = CartBloc();
      shoppingCartBloc.add(ball);
      shoppingCartBloc.add(ball);
      shoppingCartBloc.add(bat);
    });

    test("When removing item it should emit ItemRemoved", () {
      final expectedStates = [
        ItemRemoved(cartItems: [
          CartItem(ball, quantity: 1),
          CartItem(bat, quantity: 1)
        ], itemsCount: 2, totalPrice: ball.price + bat.price)
      ];

      expectLater(shoppingCartBloc.state, emitsInOrder(expectedStates));

      shoppingCartBloc.remove(ball.id);
    });
  });
}
