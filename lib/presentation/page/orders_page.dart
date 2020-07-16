import 'package:caderninho/order/bloc.dart';
import 'package:caderninho/presentation/widgets/navigation_drawer.dart';
import 'package:caderninho/presentation/widgets/order_icon.dart';
import 'package:caderninho/presentation/widgets/orders.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../navigator.dart';
import 'new_order_page.dart';

class OrdersPage extends StatefulWidget {
  @override
  State createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  final title = "Orders";
  OrderBloc orderBloc;

  @override
  void initState() {
    super.initState();
    orderBloc = Provider.of<OrderBloc>(context, listen: false);
    orderBloc.fetchOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[OrderIcon()],
      ),
      body: StreamBuilder(
        stream: orderBloc.ordersResult,
        builder: (context, snapshot) {
          return OrdersWidget(snapshot?.data ?? List());
        },
      ),
      drawer: NavigationDrawer(),
      floatingActionButton: Consumer<OrderBloc>(
        builder: (context, orderBloc, _) {
          if (orderBloc.hasOngoingOrder)
            return Container();
          else
            return FloatingActionButton(
              child: Icon(Icons.add_shopping_cart),
              onPressed: () => push(context, NewOrderPage()),
            );
        },
      ),
    );
  }
}
