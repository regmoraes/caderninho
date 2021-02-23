import 'package:caderninho/order/bloc/order_history_bloc.dart';
import 'package:caderninho/order/repository/in_memory_repository.dart';
import 'package:caderninho/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'catalog/bloc/bloc.dart';
import 'catalog/repository/in_memory_repository.dart';
import 'customer/bloc/bloc.dart';
import 'customer/repository/in_memory_repository.dart';
import 'order/bloc/order_bloc.dart';
import 'page/home_page.dart';

void main() => runApp(Caderninho());

class Caderninho extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider<CatalogBloc>(
          create: (_) => CatalogBloc(InMemoryCatalog()),
        ),
        BlocProvider<CustomerBloc>(
          create: (_) => CustomerBloc(InMemoryCustomers()),
        ),
        BlocProvider<OrderBloc>(
          create: (_) => OrderBloc(InMemoryOrder()),
        ),
        BlocProvider<OrderHistoryBloc>(
          create: (_) => OrderHistoryBloc(InMemoryOrder()),
        ),
      ],
      child: MaterialApp(
        title: 'Caderninho',
        theme: caderninhoTheme,
        home: HomePage(),
      ),
    );
  }
}
