import 'dart:math';

import 'package:caderninho/catalog/bloc.dart';
import 'package:caderninho/catalog/product.dart';
import 'package:caderninho/catalog/states.dart';
import 'package:caderninho/presentation/widgets/currency_field.dart';
import 'package:caderninho/presentation/widgets/custom_text_field.dart';
import 'package:caderninho/presentation/widgets/ok_button.dart';
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
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final catalogBloc = Provider.of<CatalogBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CustomTextField(
              hintText: "Modelo",
              controller: formController.name,
            ),
            SizedBox(height: 8),
            CustomTextField(
              hintText: 'Marca',
              controller: formController.description,
            ),
            SizedBox(height: 8),
            CurrencyField(
              hintText: 'Preço',
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
                  return OkButton(
                    () {
                      catalogBloc.addProduct(formController.buildProduct());
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _FormController {
  final name = TextEditingController();
  final description = TextEditingController();
  final price = CurrencyEditingController();

  Product buildProduct() {
    return Product(
      // TODO Remove random id generation
      id: Random().nextInt(100),
      name: name.text,
      description: description.text,
      priceInCents: price.cents,
    );
  }
}
