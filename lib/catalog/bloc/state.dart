import 'package:caderninho/catalog/catalog.dart';
import 'package:equatable/equatable.dart';

abstract class CatalogState extends Equatable {
  final List<Object> _props;

  CatalogState([this._props]);

  @override
  List<Object> get props => _props ?? [];
}

class CatalogUpdated extends CatalogState {
  final Catalog catalog;

  CatalogUpdated(this.catalog): super([catalog]);
}

class Fetching extends CatalogState {}

class Error extends CatalogState {}

class AddingProduct extends CatalogState {}

class ErrorWhileAdding extends CatalogState {}
