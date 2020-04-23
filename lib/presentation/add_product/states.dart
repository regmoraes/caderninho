import 'package:equatable/equatable.dart';

abstract class AddProductState extends Equatable {}

class AddingProduct extends AddProductState {
  @override
  List<Object> get props => [];
}

class ProductAdded extends AddProductState {
  @override
  List<Object> get props => [];
}

class ErrorWhileAdding extends AddProductState {
  @override
  List<Object> get props => [];
}
