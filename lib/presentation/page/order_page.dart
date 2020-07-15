import 'package:caderninho/bloc/order_bloc.dart';
import 'package:caderninho/presentation/navigator.dart';
import 'package:caderninho/presentation/widgets/order.dart';
import 'package:caderninho/presentation/widgets/order_resume.dart';
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
