import 'package:caderninho/presentation/bloc/cart_bloc.dart';
import 'package:caderninho/presentation/widgets/cart_items.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  @override
  State createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final title = "Caderninho";
  CartBloc cartBloc;

  @override
  void initState() {
    super.initState();
    cartBloc = Provider.of<CartBloc>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    cartBloc = Provider.of<CartBloc>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: CartItemsWidget(cartBloc));
  }
}
