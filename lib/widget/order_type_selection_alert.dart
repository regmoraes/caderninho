import 'package:caderninho/order/order_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

typedef OnOrderTypeSelected(OrderType orderType);

class OrderTypeSelectionAlert extends StatefulWidget {
//  final OnOrderTypeSelected onOrderTypeSelected;

  @override
  State<StatefulWidget> createState() => _OrderTypeSelectionAlertState();
}

class _OrderTypeSelectionAlertState extends State<OrderTypeSelectionAlert> {
  OrderType _orderType = OrderType.INSTALMENT;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Container(
        child: AlertDialog(
          title: Text("Tipo de Venda"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text("${OrderType.CASH.name}"),
                contentPadding: EdgeInsets.all(0),
                leading: Radio(
                    value: OrderType.CASH,
                    groupValue: _orderType,
                    onChanged: (OrderType orderType) =>
                        setState(() => _orderType = orderType)),
              ),
              ListTile(
                title: Text("${OrderType.INSTALMENT.name}"),
                contentPadding: EdgeInsets.all(0),
                leading: Radio(
                    value: OrderType.INSTALMENT,
                    groupValue: _orderType,
                    onChanged: (OrderType orderType) =>
                        setState(() => _orderType = orderType)),
              ),
              ListTile(
                title: Text("${OrderType.CONSIGN.name}"),
                contentPadding: EdgeInsets.all(0),
                leading: Radio(
                    value: OrderType.CONSIGN,
                    groupValue: _orderType,
                    onChanged: (OrderType orderType) =>
                        setState(() => _orderType = orderType)),
              ),
            ],
          ),
          actions: [
            FlatButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.pop(context, _orderType);
              },
            )
          ],
        ),
      ),
    );
  }
}
