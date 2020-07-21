import 'dart:io';
import 'dart:math';

import 'package:caderninho/catalog/bloc.dart';
import 'package:caderninho/catalog/product.dart';
import 'package:caderninho/catalog/states.dart';
import 'package:caderninho/image/image_picker.dart';
import 'package:caderninho/widget/currency_field.dart';
import 'package:caderninho/widget/custom_text_field.dart';
import 'package:caderninho/widget/ok_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'navigator.dart';

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
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            GestureDetector(
              child: formController.imageFile == null
                  ? Center(child: Icon(Icons.photo_camera))
                  : Image.file(
                      formController.imageFile,
                      width: 400,
                      height: 300,
                      fit: BoxFit.contain,
                    ),
              onTap: () async {
                final imageFile = await getImage();
                setState(() => formController.imageFile = imageFile);
              },
            ),
            const SizedBox(height: 8),
            CustomTextField(
              hintText: "Modelo",
              controller: formController.name,
            ),
            const SizedBox(height: 8),
            CustomTextField(
              hintText: 'Marca',
              controller: formController.description,
            ),
            const SizedBox(height: 8),
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
  File imageFile;

  Product buildProduct() {
    return Product(
      // TODO Remove random id generation
        id: Random().nextInt(100),
        name: name.text,
        description: description.text,
        priceInCents: price.cents,
        imagePath: imageFile.path);
  }
}
