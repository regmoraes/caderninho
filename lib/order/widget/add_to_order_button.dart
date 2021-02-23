import 'package:caderninho/catalog/product.dart';
import 'package:caderninho/order/bloc/order_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class AddToCartButton extends StatelessWidget {
  final Product product;

  AddToCartButton(this.product);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        "Adicionar ao Carrinho",
        textAlign: TextAlign.center,
      ),
      onPressed: () => context.read<OrderBloc>().addProduct(product),
    );
  }
}
