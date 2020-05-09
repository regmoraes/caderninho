import 'package:caderninho/domain/catalog/product.dart';
import 'package:caderninho/presentation/bloc/cart_bloc.dart';
import 'package:caderninho/presentation/widgets/cart_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  CartBloc _cartBloc;
  final ball = Product(id: 1, name: "Ball", description: "A ball", price: 10);

  group("Given an empty Cart", () {
    setUp(() {
      _cartBloc = CartBloc();
    });

    tearDown(() {
      _cartBloc.close();
    });

    testWidgets("It shouldn't show any badges on icon", (tester) async {
      final cartWidget = CartIcon(_cartBloc);

      await tester.pumpWidget(MaterialApp(home: cartWidget));

      expect(find.byWidget(cartWidget), findsOneWidget);
      expect(find.byType(Text), findsNothing);
    });

    testWidgets("When product to cart it should show item count",
        (tester) async {
          final cartWidget = CartIcon(_cartBloc);

      await tester.pumpWidget(MaterialApp(home: cartWidget));

      _cartBloc.add(ball);
      _cartBloc.add(ball);

      await tester.idle();
      await tester.pump(Duration.zero);

      expect(find.byWidget(cartWidget), findsOneWidget);
      expect(find.text("2"), findsOneWidget);
    });
  });
}
