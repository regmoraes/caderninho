import 'package:caderninho/order/bloc.dart';
import 'package:caderninho/presentation/widgets/order_icon.dart';
import 'package:caderninho/presentation/widgets/orders.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../navigator.dart';
import 'new_order_page.dart';

class CustomerOrdersPage extends StatefulWidget {
  final int customerId;

  CustomerOrdersPage(this.customerId);

  @override
  State createState() => _CustomerOrdersPageState();
}

class _CustomerOrdersPageState extends State<CustomerOrdersPage> {
  final title = "Orders";
  OrderBloc orderBloc;

  @override
  void initState() {
    super.initState();
    orderBloc = Provider.of<OrderBloc>(context, listen: false);
    orderBloc.fetchCustomerOrders(widget.customerId);
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
