import 'package:caderninho/presentation/page/catalog_page.dart';
import 'package:caderninho/presentation/page/dashboard_page.dart';
import 'package:flutter/material.dart';

import '../navigator.dart';

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Drawer Header'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                push(context, DashboardPage(), replace: true);
              }),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Customers'),
          ),
          ListTile(
            leading: Icon(Icons.local_offer),
            title: Text('Catalog'),
            onTap: () => push(context, CatalogPage(), replace: true),
          )
        ],
      ),
    );
  }
}