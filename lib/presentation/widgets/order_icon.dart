import 'package:caderninho/bloc/order_bloc.dart';
import 'package:caderninho/presentation/navigator.dart';
import 'package:caderninho/presentation/page/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<OrderBloc>(
      builder: (context, orderBloc, child) {
        if (!orderBloc.hasOnGoingOrder) {
          return Container();
        } else if (orderBloc.order.isEmpty) {
          return child;
        } else {
          return Stack(
            children: <Widget>[
              child,
              Positioned(
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 12,
                    minHeight: 12,
                  ),
                  child: Text(
                    "${orderBloc.order.itemsCount}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          );
        }
      },
      child: IconButton(
        icon: Icon(Icons.shopping_cart),
        onPressed: () {
          push(context, CartPage());
        },
      ),
    );
  }
}
