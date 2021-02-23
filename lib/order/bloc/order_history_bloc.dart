import 'package:caderninho/order/bloc/order_history_state.dart';
import 'package:caderninho/order/repository/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderHistoryBloc extends Cubit<OrderHistoryState> {
  final OrderRepository _orderRepository;

  OrderHistoryBloc(this._orderRepository) : super(FetchingOrders());

  void fetchCustomerOrders(int customerId) async {
    final orders = await _orderRepository.fetchAllByCustomer(customerId);
    emit(OrdersFetched(orders));
  }
}
