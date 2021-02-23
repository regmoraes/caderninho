import 'package:equatable/equatable.dart';

class Contact extends Equatable {
  final String name;
  final String phoneNumber;

  Contact({this.name, this.phoneNumber});

  @override
  List<Object> get props => [name, phoneNumber];
}
