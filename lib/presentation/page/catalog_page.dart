import 'package:caderninho/domain/catalog/search.dart';
import 'package:caderninho/presentation/bloc/cart_bloc.dart';
import 'package:caderninho/presentation/navigator.dart';
import 'package:caderninho/presentation/page/new_product_page.dart';
import 'package:caderninho/presentation/widgets/cart.dart';
import 'package:caderninho/presentation/widgets/catalog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bloc/catalog_bloc.dart';
import '../bloc/catalog_states.dart';

class CatalogPage extends StatefulWidget {
  @override
  State createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  final title = "Caderninho";
  CatalogBloc catalogBloc;
  CartBloc cartBloc;

  @override
  void initState() {
    super.initState();
    catalogBloc = Provider.of<CatalogBloc>(context, listen: false);
    catalogBloc.fetchCatalog(FetchAll());
  }

  @override
  Widget build(BuildContext context) {
    cartBloc = Provider.of<CartBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[CartWidget(cartBloc)],
      ),
      body: CatalogWidget(catalogBloc),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          final addProductResult = await push(context, NewProductPage());
          if (addProductResult is ProductAdded) {
            catalogBloc.fetchCatalog(EmptySearch());
          }
        },
      ),
    );
  }
}
