import 'package:caderninho/bloc/catalog_bloc.dart';
import 'package:caderninho/bloc/catalog_states.dart';
import 'package:caderninho/model/catalog/search.dart';
import 'package:caderninho/presentation/navigator.dart';
import 'package:caderninho/presentation/widgets/cart_icon.dart';
import 'package:caderninho/presentation/widgets/catalog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'new_product_page.dart';

class CatalogPage extends StatefulWidget {
  @override
  State createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  final title = "Caderninho";
  CatalogBloc catalogBloc;

  @override
  void initState() {
    super.initState();
    catalogBloc = Provider.of<CatalogBloc>(context, listen: false);
    catalogBloc.fetchCatalog(FetchAll());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[CartIcon()],
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
