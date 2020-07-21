import 'package:caderninho/page/catalog_page.dart';
import 'package:caderninho/page/customers_page.dart';
import 'package:caderninho/page/dashboard_page.dart';
import 'package:caderninho/page/navigator.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  @override
  State createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  var selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: (position) {
        switch (position) {
          case 0:
            push(context, CustomersPage(), replace: true);
            break;
          case 1:
            push(context, DashboardPage(), replace: true);
            break;
          case 2:
            push(context, CatalogPage(), replace: true);
            break;
          default:
            break;
        }
        selectedIndex = position;
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
    );
  }
}
