import 'package:caderninho/order/order.dart';
import 'package:equatable/equatable.dart';

abstract class OrderState extends Equatable {
  final List<Object> _props;

  OrderState([this._props]);

  @override
  List<Object> get props => _props ?? [];
}

class OrderInitialState extends OrderState {}

class OrderUpdated extends OrderState {
  final Order order;

  OrderUpdated(this.order) : super([order]);
}

class OrderCleared extends OrderState {}
