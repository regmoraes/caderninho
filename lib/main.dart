import 'package:caderninho/infrastructure/in_memory_customers.dart';
import 'package:caderninho/presentation/page/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'bloc/cart_bloc.dart';
import 'bloc/catalog_bloc.dart';
import 'bloc/customers_bloc.dart';
import 'infrastructure/in_memory_catalog.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<CatalogBloc>(
          create: (_) => CatalogBloc(InMemoryCatalog()),
        ),
        Provider<CustomersBloc>(
          create: (_) => CustomersBloc(InMemoryCustomers()),
        ),
        ChangeNotifierProvider<ShoppingCartBloc>(
          create: (_) => ShoppingCartBloc(),
        )
      ],
      child: MaterialApp(
        title: 'Caderninho',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: DashboardPage(),
      ),
    );
  }
}
