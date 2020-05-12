import 'package:caderninho/bloc/cart_bloc.dart';
import 'package:caderninho/model/cart/cart_item.dart';
import 'package:caderninho/model/catalog/product.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  ShoppingCartBloc cartBloc;

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
      cartBloc = ShoppingCartBloc();
    });

    test("When asking if it is empty it should return true", () {
      expect(cartBloc.shoppingCart.isEmpty, true);
    });

    test("When adding products it should increase items count", () {
      cartBloc.addToCart(ball);
      cartBloc.addToCart(bat);

      expect(
        cartBloc.shoppingCart.cartItems,
        [CartItem(ball, quantity: 1), CartItem(bat, quantity: 1)],
      );

      expect(cartBloc.shoppingCart.itemsCount, 2);
    });

    test(
        "When adding same product it should update total and unique items count",
        () {
      cartBloc.addToCart(ball);
      cartBloc.addToCart(ball);

      expect(
        cartBloc.shoppingCart.cartItems,
        [CartItem(ball, quantity: 2)],
      );

      expect(cartBloc.shoppingCart.itemsCount, 2);
    });

    test("When products are added it should not be empty", () {
      cartBloc.addToCart(ball);
      expect(cartBloc.shoppingCart.isEmpty, false);
    });
  });

  group('Given a non empty Shopping Cart', () {
    setUp(() {
      cartBloc = ShoppingCartBloc();
      cartBloc.addToCart(ball);
      cartBloc.addToCart(bat);
    });

    test("When removing item it should decrease item count", () {
      cartBloc.removeFromCart(ball.id);

      expectLater(cartBloc.shoppingCart.itemsCount, 1);
    });
  });
}
