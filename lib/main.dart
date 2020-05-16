import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'bloc/cart_bloc.dart';
import 'bloc/catalog_bloc.dart';
import 'infrastructure/in_memory_catalog.dart';
import 'presentation/page/catalog_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<CatalogBloc>(
          create: (_) => CatalogBloc(InMemoryCatalog()),
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
        home: CatalogPage(),
      ),
    );
  }
}
