import 'package:caderninho/order/in_memory_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'catalog/bloc.dart';
import 'catalog/in_memory_repository.dart';
import 'customer/bloc.dart';
import 'customer/in_memory_repository.dart';
import 'order/bloc.dart';
import 'page/home_page.dart';

void main() => runApp(Caderninho());

class Caderninho extends StatelessWidget {
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
          create: (_) => OrderBloc(InMemoryOrder()),
        )
      ],
      child: MaterialApp(
        title: 'Caderninho',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}
