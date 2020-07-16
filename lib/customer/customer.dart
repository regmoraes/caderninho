import 'package:equatable/equatable.dart';

class Customer extends Equatable {
  final int id;
  final String name;

  Customer({this.id, this.name});

  @override
  List<Object> get props => [id, name];
}
