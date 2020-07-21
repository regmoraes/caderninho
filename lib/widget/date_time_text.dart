import 'package:caderninho/order/date.dart';
import 'package:flutter/cupertino.dart';

class DateTimeText extends Text {
  DateTimeText(String dateTime) : super(formatDate(dateTime));
}
