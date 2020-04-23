import 'package:caderninho/domain/catalog/search.dart';
import 'package:caderninho/infrastructure/dependency_injection.dart';
import 'package:caderninho/presentation/catalog/bloc.dart';
import 'package:caderninho/presentation/catalog/widgets.dart';
import 'package:flutter/material.dart';

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
