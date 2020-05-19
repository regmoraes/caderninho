import 'package:caderninho/bloc/order_bloc.dart';
import 'package:caderninho/model/order/order_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderItemsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - 200) / 2;
    final double itemWidth = size.width / 2;

    return Consumer<OrderBloc>(
      builder: (context, orderBloc, child) {
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: itemWidth / itemHeight,
          ),
          itemCount: orderBloc.order.items.length,
          itemBuilder: (context, index) =>
              _orderItem(context, orderBloc.order.items[index]),
        );
      },
    );
  }

  Widget _orderItem(BuildContext context, OrderItem orderItem) {
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
                  "\$ ${orderItem.product.price}",
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
