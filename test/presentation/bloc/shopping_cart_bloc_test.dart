import 'package:caderninho/domain/catalog/product.dart';
import 'package:caderninho/domain/shopping_cart/cart_item.dart';
import 'package:caderninho/presentation/bloc/cart_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  CartBloc cartBloc;

  final ball = Product(
    id: 1,
    name: "Ball",
    description: "A ball",
    price: 100,
  );

  final bat = Product(
    id: 2,
    name: "Bat",
    description: "A baseball bat",
    price: 500,
  );

  group('Given an empty Shopping Cart', () {
    setUp(() {
      cartBloc = CartBloc();
    });

    test("When asking if it is empty it should return true", () {
      expect(cartBloc.isEmpty, true);
    });

    test("When adding products it should increase items count", () {
      cartBloc.add(ball);
      cartBloc.add(bat);

      expect(
        cartBloc.cartItems,
        [CartItem(ball, quantity: 1), CartItem(bat, quantity: 1)],
      );

      expect(cartBloc.itemsCount, 2);
    });

    test(
        "When adding same products it should update total and unique items count",
            () {
          cartBloc.add(ball);
          cartBloc.add(ball);

          expect(
            cartBloc.cartItems,
            [CartItem(ball, quantity: 2)],
          );

          expect(cartBloc.itemsCount, 2);
        });

    test("When products are added it should not be empty", () {
      cartBloc.add(ball);
      expect(cartBloc.isEmpty, false);
    });
  });

  group('Given a non empty Shopping Cart', () {
    setUp(() {
      cartBloc = CartBloc();
      cartBloc.add(ball);
      cartBloc.add(bat);
    });

    test("When removing item it should decrease item count", () {
      cartBloc.remove(ball.id);

      expectLater(cartBloc.itemsCount, 1);
    });
  });
}
