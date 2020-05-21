import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'bloc/catalog_bloc.dart';
import 'bloc/customers_bloc.dart';
import 'bloc/order_bloc.dart';
import 'infrastructure/in_memory_catalog.dart';
import 'infrastructure/in_memory_customers.dart';
import 'presentation/page/dashboard_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<CatalogBloc>(
          create: (_) => CatalogBloc(InMemoryCatalog()),
        ),
        Provider<CustomerBloc>(
          create: (_) => CustomerBloc(InMemoryCustomers()),
        ),
        ChangeNotifierProvider<OrderBloc>(
          create: (_) => OrderBloc(),
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
