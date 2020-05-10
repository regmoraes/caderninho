import 'package:caderninho/domain/catalog/product.dart';
import 'package:caderninho/presentation/bloc/cart_bloc.dart';
import 'package:caderninho/presentation/bloc/catalog_bloc.dart';
import 'package:caderninho/presentation/bloc/catalog_states.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CatalogWidget extends StatelessWidget {
  final CatalogBloc _catalogBloc;

  CatalogWidget(this._catalogBloc);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - 200) / 2;
    final double itemWidth = size.width / 2;

    return StreamBuilder(
      stream: _catalogBloc.state,
      builder: (context, snapshot) {
        if (snapshot.data is Fetched) {
          final catalog = snapshot.data.catalog;
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: itemWidth / itemHeight,
            ),
            itemCount: catalog.products.length,
            itemBuilder: (context, index) =>
                _productItem(context, catalog.products[index]),
          );
        } else {
          return _loading();
        }
      },
    );
  }

  Widget _productItem(BuildContext context, Product product) {
    return GestureDetector(
      child: Card(
        clipBehavior: null,
        margin: EdgeInsets.all(8),
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
                child: Text(
              "${product.name}",
              textAlign: TextAlign.center,
            )),
            Container(
                child: Text(
              "\$ ${product.price}",
              textAlign: TextAlign.center,
            )),
            Consumer<CartBloc>(
              builder: (context, cartBloc, _) => RaisedButton(
                child: Text("Add to Cart"),
                onPressed: () => cartBloc.add(product),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _loading() {
    return Center(child: CircularProgressIndicator());
  }
}
