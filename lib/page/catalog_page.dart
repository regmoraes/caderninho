import 'package:caderninho/catalog/bloc.dart';
import 'package:caderninho/catalog/search.dart';
import 'package:caderninho/catalog/states.dart';
import 'package:caderninho/catalog/widget/catalog_widget.dart';
import 'package:caderninho/page/navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'new_product_page.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage();

  @override
  State createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  final title = "Catalog";
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
      body: StreamBuilder(
        stream: catalogBloc.state,
        builder: (context, snapshot) {
          if (snapshot.data is Fetched || snapshot.data is ProductAdded) {
            return CatalogWidget(snapshot.data.catalog);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => push(context, NewProductPage()),
      ),
    );
  }
}
