import 'package:caderninho/model/catalog/catalog.dart';
import 'package:equatable/equatable.dart';

abstract class CatalogState extends Equatable {}

class Fetched extends CatalogState {
  final Catalog catalog;

  Fetched(this.catalog);

  @override
  List<Object> get props => [catalog];
}

class Fetching extends CatalogState {
  @override
  List<Object> get props => [];
}

class Error extends CatalogState {
  @override
  List<Object> get props => [];
}

class AddingProduct extends CatalogState {
  @override
  List<Object> get props => [];
}

class ProductAdded extends CatalogState {
  final Catalog catalog;

  ProductAdded(this.catalog);

  @override
  List<Object> get props => [catalog];
}

class ErrorWhileAdding extends CatalogState {
  @override
  List<Object> get props => [];
}
