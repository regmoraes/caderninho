import 'package:caderninho/presentation/catalog/page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Caderninho',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CatalogPage(title: 'Caderninho'),
    );
  }
}
