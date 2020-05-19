import 'dart:math';

import 'package:caderninho/bloc/catalog_bloc.dart';
import 'package:caderninho/bloc/catalog_states.dart';
import 'package:caderninho/model/catalog/product.dart';
import 'package:flutter/material.dart';

class ProductForm extends StatelessWidget {
  final CatalogBloc _catalogBloc;
  final _formController = _FormController();

  ProductForm(this._catalogBloc);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextField(
          controller: _formController.name,
        ),
        TextField(
          controller: _formController.description,
        ),
        TextField(
          controller: _formController.price,
        ),
        StreamBuilder(
          stream: _catalogBloc.state,
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
                  final product = _formController.toProduct();
                  _catalogBloc.addProduct(product);
                },
              );
            }
          },
        ),
      ],
    );
  }
}

class _FormController {
  final name = TextEditingController();
  final description = TextEditingController();
  final price = TextEditingController();

  Product toProduct() {
    return Product(
      // TODO Remove random id generation
      id: Random().nextInt(100),
      name: name.text,
      description: description.text,
      price: int.parse(price.text),
    );
  }
}
