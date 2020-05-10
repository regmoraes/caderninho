import 'package:caderninho/domain/catalog/product.dart';
import 'package:caderninho/presentation/bloc/cart_bloc.dart';
import 'package:caderninho/presentation/widgets/cart_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  CartBloc _cartBloc;
  final ball = Product(id: 1, name: "Ball", description: "A ball", price: 10);

  setUp(() {
    _cartBloc = CartBloc();
  });

  group("Given an empty Cart", () {
    testWidgets("It shouldn't show any badges on icon", (tester) async {
      final cartIcon = CartIcon();

      await tester.pumpWidget(
        ChangeNotifierProvider(
            create: (_) => _cartBloc,
            child: MaterialApp(home: Scaffold(body: cartIcon))),
      );

      expect(find.byWidget(cartIcon), findsOneWidget);
      expect(find.byType(Text), findsNothing);
    });
  });

  group("Given a non empty Cart", () {
    testWidgets("When cart is not empty it should show item count",
        (tester) async {
          final cartIcon = CartIcon();

          await tester.pumpWidget(
            ChangeNotifierProvider.value(
                value: _cartBloc,
                child: MaterialApp(home: Scaffold(body: cartIcon))),
          );

      _cartBloc.add(ball);
      _cartBloc.add(ball);

      await tester.idle();
      await tester.pump(Duration.zero);

          expect(find.byWidget(cartIcon), findsOneWidget);
      expect(find.text("2"), findsOneWidget);
    });
  });
}
