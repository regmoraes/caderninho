import 'package:caderninho/order/bloc.dart';
import 'package:caderninho/page/navigator.dart';
import 'package:caderninho/widget/order_resume.dart';
import 'package:caderninho/widget/order_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderPage extends StatefulWidget {
  @override
  State createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final title = "Carrinho";

  @override
  Widget build(BuildContext context) {
    final orderBloc = Provider.of<OrderBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {
              orderBloc.checkout();
              pop(context);
            },
          )
        ],
      ),
      body: OrderWidget(),
      bottomNavigationBar: OrderResume(),
    );
  }
}
