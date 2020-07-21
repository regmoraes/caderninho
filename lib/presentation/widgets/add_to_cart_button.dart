import 'package:caderninho/catalog/product.dart';
import 'package:caderninho/order/bloc.dart';
import 'package:caderninho/presentation/button_style.dart' as ButtonStyle;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class AddToCartButton extends StatelessWidget {
  final Product product;

  AddToCartButton(this.product);

  @override
  Widget build(BuildContext context) {
    final orderBloc = context.watch<OrderBloc>();
    return RaisedButton(
      child: Text(
        "Adicionar ao Carrinho",
        textAlign: TextAlign.center,
      ),
      color: ButtonStyle.backgroundColor,
      textColor: ButtonStyle.textColor,
      onPressed: () => orderBloc.addProduct(product),
    );
  }
}
