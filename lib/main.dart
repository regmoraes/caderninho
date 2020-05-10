import 'package:caderninho/presentation/bloc/cart_bloc.dart';
import 'package:caderninho/presentation/bloc/catalog_bloc.dart';
import 'package:caderninho/presentation/page/catalog_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'infrastructure/di/application_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<CatalogBloc>(
          create: (_) => CatalogBloc(fetchCatalog, addProduct),
        ),
        ChangeNotifierProvider<CartBloc>(
          create: (_) => CartBloc(),
        )
      ],
      child: MaterialApp(
        title: 'Caderninho',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: CatalogPage(),
      ),
    );
  }
}
