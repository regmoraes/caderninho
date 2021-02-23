import 'package:caderninho/order/order.dart';
import 'package:equatable/equatable.dart';

abstract class OrderHistoryState extends Equatable {
  final List<Object> _props;

  OrderHistoryState([this._props]);

  @override
  List<Object> get props => _props ?? [];
}

class FetchingOrders extends OrderHistoryState {}

class OrdersFetched extends OrderHistoryState {
  final List<Order> orders;

  OrdersFetched(this.orders) : super([orders]);
}
