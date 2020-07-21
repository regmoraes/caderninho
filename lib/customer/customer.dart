import 'package:equatable/equatable.dart';

class Customer extends Equatable {
  final int id;
  final String name;
  final String phoneNumber;

  Customer({this.id, this.name, this.phoneNumber});

  @override
  List<Object> get props => [id, name, phoneNumber];
}
