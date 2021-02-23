import 'package:caderninho/catalog/bloc/bloc.dart';
import 'package:caderninho/catalog/bloc/state.dart';
import 'package:caderninho/catalog/search.dart';
import 'package:caderninho/catalog/widget/catalog_widget.dart';
import 'package:caderninho/page/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'new_product_page.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage();

  @override
  State createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  final title = "Catalog";

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CatalogBloc>(context)..fetchCatalog(FetchAll());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CatalogBloc, CatalogState>(
        builder: (context, state) {
          if (state is Fetching) {
            return Center(child: CircularProgressIndicator());
          } else if (state is CatalogUpdated) {
            return CatalogWidget(state.catalog);
          } else {
            return Container();
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
