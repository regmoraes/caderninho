import 'package:caderninho/presentation/widgets/new_order_fab.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage();

  @override
  State createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Nothing here")),
      floatingActionButton: NewOrderFloatActionButton(),
    );
  }
}
