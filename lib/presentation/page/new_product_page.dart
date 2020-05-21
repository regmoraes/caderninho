import 'dart:math';

import 'package:caderninho/bloc/catalog_bloc.dart';
import 'package:caderninho/bloc/catalog_states.dart';
import 'package:caderninho/model/catalog/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../navigator.dart';

class NewProductPage extends StatefulWidget {
  @override
  _NewProductPageState createState() => _NewProductPageState();
}

class _NewProductPageState extends State<NewProductPage> {
  final title = "New Product";
  final formController = _FormController();
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
    final catalogBloc = Provider.of<CatalogBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextField(
            controller: formController.name,
          ),
          TextField(
            controller: formController.description,
          ),
          TextField(
            controller: formController.price,
          ),
          StreamBuilder(
            stream: catalogBloc.state,
            builder: (context, snapshot) {
              if (snapshot.data is AddingProduct) {
                return RaisedButton(
                  child: CircularProgressIndicator(),
                  onPressed: null,
                );
              } else {
                return RaisedButton(
                  child: Text("Ok"),
                  onPressed: () {
                    catalogBloc.addProduct(formController.buildProduct());
                  },
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

class _FormController {
  final name = TextEditingController();
  final description = TextEditingController();
  final price = TextEditingController();

  Product buildProduct() {
    return Product(
      // TODO Remove random id generation
      id: Random().nextInt(100),
      name: name.text,
      description: description.text,
      price: int.parse(price.text),
    );
  }
}
