import 'dart:io';

import 'package:caderninho/order/bloc.dart';
import 'package:caderninho/order/order_item.dart';
import 'package:caderninho/presentation/button_style.dart' as ButtonStyle;
import 'package:caderninho/presentation/widgets/currency_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderItemWidget extends StatelessWidget {
  final OrderItem orderItem;

  OrderItemWidget(this.orderItem);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        clipBehavior: null,
        margin: EdgeInsets.all(8),
        elevation: 4,
        child: Padding(
          padding: EdgeInsets.all(4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Image.file(
                File(orderItem.product.imagePath),
                filterQuality: FilterQuality.medium,
              ),
              Text(
                "${orderItem.product.name}",
                textAlign: TextAlign.center,
              ),
              Text(
                "${orderItem.product.description}",
                textAlign: TextAlign.center,
              ),
              CurrencyText(orderItem.product.priceInCents),
              Text(
                "Quantidade: ${orderItem.quantity}",
                textAlign: TextAlign.center,
              ),
              Consumer<OrderBloc>(
                builder: (context, orderBloc, _) => RaisedButton(
                  child: Text(
                    "Remover do Carrinho",
                    textAlign: TextAlign.center,
                  ),
                  color: ButtonStyle.backgroundColor,
                  textColor: ButtonStyle.textColor,
                  onPressed: () =>
                      orderBloc.removeProduct(orderItem.product.id),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
