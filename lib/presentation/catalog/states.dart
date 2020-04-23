import 'package:caderninho/domain/catalog/catalog.dart';
import 'package:equatable/equatable.dart';

abstract class CatalogState extends Equatable {}

class CatalogFetched extends CatalogState {
  final Catalog catalog;

  CatalogFetched(this.catalog);

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
