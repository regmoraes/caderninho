import 'package:caderninho/order/date.dart';
import 'package:caderninho/widget/currency_formatter.dart';

import 'order.dart';
import 'order_item.dart';

String createOrderResume(Order order) {
  return _orderNumber(order.id) +
      _orderDate(order.date) +
      _customerName(order.customer.name) +
      _products(order.items) +
      _orderTotalPrice(order.totalPrice);
}

String _orderNumber(int orderNumber) => "*Pedido #$orderNumber*\n\n";

String _orderDate(String orderDate) => "*Data:* ${formatDate(orderDate)}\n\n";

String _customerName(String customerName) => "*Cliente:* $customerName\n\n";

String _products(List<OrderItem> orderItems) {
  final header = "*Produtos:*\n\n";
  final products = orderItems
      .map((orderItem) =>
          "*Nome:* ${orderItem.product.name}\n*Valor Unitário:* ${priceTextFrom(orderItem.product.priceInCents)}\n*Qtd:* ${orderItem.quantity}\n*Total:*  ${priceTextFrom(orderItem.totalPrice)}\n\n")
      .reduce((value, element) => value + element);
  return header + products;
}

String _orderTotalPrice(int totalPrice) =>
    "*Total do Pedido:* ${priceTextFrom(totalPrice)}";
