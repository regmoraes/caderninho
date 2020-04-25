import 'package:caderninho/domain/catalog/product.dart';
import 'package:caderninho/domain/shopping_cart/shopping_cart.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  ShoppingCart shoppingCart;

  final ball = Product(id: 1, name: "Ball", description: "A ball", price: 100);
  final bat =
      Product(id: 2, name: "Bat", description: "A baseball bat", price: 500);

  group('Given an empty Shopping Cart', () {
    setUp(() {
      shoppingCart = ShoppingCart();
    });

    test("When adding products it should update total price", () {
      shoppingCart.add(ball);
      shoppingCart.add(bat);

      final expectedTotalPrice = 600;

      expect(shoppingCart.totalPrice, expectedTotalPrice);
    });

    test("When adding same product it should update product quantity", () {
      shoppingCart.add(ball);
      shoppingCart.add(ball);

      expect(shoppingCart.totalPrice, 200);

      expect(shoppingCart.itemsCount, 2);
    });
  });

  group('Given a non empty Shopping Cart', () {
    setUp(() {
      shoppingCart = ShoppingCart();
      shoppingCart.add(ball);
      shoppingCart.add(ball);
      shoppingCart.add(bat);
    });

    test("When removing item it should decrease quantity", () {
      expect(shoppingCart.itemsCount, 3);
      shoppingCart.remove(ball.id);
      expect(shoppingCart.itemsCount, 2);
    });
  });
}
