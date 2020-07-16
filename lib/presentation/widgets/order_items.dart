import 'package:caderninho/order/bloc.dart';
import 'package:caderninho/order/order_item.dart';
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
                child: Text(
              "${orderItem.product.name}",
              textAlign: TextAlign.center,
            )),
            Container(
                child: Text(
                  "\$ ${orderItem.product.priceInCents}",
                  textAlign: TextAlign.center,
            )),
            Container(
                child: Text(
                  "Quantity: ${orderItem.quantity}",
              textAlign: TextAlign.center,
            )),
            Consumer<OrderBloc>(
              builder: (context, orderBloc, _) =>
                  RaisedButton(
                    child: Text("Remover"),
                    onPressed: () =>
                        orderBloc.removeProduct(orderItem.product.id),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
