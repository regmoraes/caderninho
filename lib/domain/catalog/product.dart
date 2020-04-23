import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final String name;
  final String description;
  final int price;

  Product({this.id, this.name, this.description, this.price});

  @override
  List<Object> get props => [id, name, description, price];
}
