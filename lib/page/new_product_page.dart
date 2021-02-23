import 'dart:io';
import 'dart:math';

import 'package:caderninho/catalog/bloc/bloc.dart';
import 'package:caderninho/catalog/bloc/state.dart';
import 'package:caderninho/catalog/product.dart';
import 'package:caderninho/image/image_picker.dart';
import 'package:caderninho/page/navigator.dart';
import 'package:caderninho/widget/currency_field.dart';
import 'package:caderninho/widget/custom_text_field.dart';
import 'package:caderninho/widget/ok_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewProductPage extends StatefulWidget {
  @override
  _NewProductPageState createState() => _NewProductPageState();
}

class _NewProductPageState extends State<NewProductPage> {
  final title = "New Product";
  final formController = _FormController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: ListView(
          shrinkWrap: true,
          children: [
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
              hintText: "Nome",
              controller: formController.name,
            ),
            const SizedBox(height: 8),
            CustomTextField(
              hintText: 'Descrição',
              controller: formController.description,
            ),
            const SizedBox(height: 8),
            CurrencyField(
              hintText: 'Preço',
              controller: formController.price,
            ),
            BlocConsumer<CatalogBloc, CatalogState>(
              listener: (context, state) {
                if (state is CatalogUpdated) pop(context, state);
              },
              builder: (context, state) {
                if (state is AddingProduct) {
                  return RaisedButton(
                    child: CircularProgressIndicator(),
                    onPressed: null,
                  );
                } else {
                  return OkButton(
                    () {
                      context
                          .read<CatalogBloc>()
                          .addProduct(formController.buildProduct());
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
