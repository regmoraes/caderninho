import 'package:caderninho/domain/catalog/search.dart';
import 'package:caderninho/infrastructure/di/presentation_provider.dart';
import 'package:flutter/material.dart';

import 'bloc.dart';
import 'widgets.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  CatalogBloc _catalogBloc;

  @override
  void initState() {
    super.initState();
    _catalogBloc = catalogBloc;
    _catalogBloc.fetchCatalog(FetchAll());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: buildCatalog(_catalogBloc.catalogState));
  }
}
