import 'package:caderninho/bloc/catalog_bloc.dart';
import 'package:caderninho/bloc/catalog_states.dart';
import 'package:caderninho/presentation/widgets/new_product_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../navigator.dart';

class NewProductPage extends StatefulWidget {
  @override
  _NewProductPageState createState() => _NewProductPageState();
}

class _NewProductPageState extends State<NewProductPage> {
  final title = "New Product";
  CatalogBloc catalogBloc;

  @override
  void initState() {
    super.initState();

    catalogBloc = Provider.of<CatalogBloc>(context, listen: false);

    catalogBloc.state.listen(
      (state) {
        if (state is ProductAdded) {
          pop(context, state);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ProductForm(catalogBloc));
  }
}
