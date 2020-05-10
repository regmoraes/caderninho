import 'package:caderninho/presentation/widgets/cart_items.dart';
import 'package:caderninho/presentation/widgets/cart_resume.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  @override
  State createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final title = "Carrinho";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: CartItemsWidget(),
      bottomNavigationBar: CartResume(),
    );
  }
}
