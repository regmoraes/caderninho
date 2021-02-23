import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final String name;
  final String description;
  final int priceInCents;
  final String imagePath;

  Product({
    this.id,
    this.name,
    this.description,
    this.priceInCents,
    this.imagePath,
  });

  @override
  List<Object> get props => [id, name, description, priceInCents, imagePath];
}
