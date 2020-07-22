import 'package:caderninho/order/widget/order_icon.dart';
import 'package:flutter/material.dart';

import 'catalog_page.dart';
import 'customers_page.dart';
import 'dashboard_page.dart';

class HomePage extends StatefulWidget {
  const HomePage();

  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String title = "Caderninho";
  int currentPage = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[OrderIcon()],
      ),
      body: pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (position) {
          setState(() {
            currentPage = position;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Clientes'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Início'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer),
            title: Text('Catálogo'),
          )
        ],
      ),
    );
  }
}

const List<StatefulWidget> pages = [
  CustomersPage(),
  DashboardPage(),
  CatalogPage()
];
