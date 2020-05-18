import 'package:caderninho/presentation/widgets/cart_icon.dart';
import 'package:caderninho/presentation/widgets/navigation_drawer.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  @override
  State createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final title = "Caderninho";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[CartIcon()],
      ),
      body: Container(),
      drawer: NavigationDrawer(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_shopping_cart),
        onPressed: () => null,
      ),
    );
  }
}
