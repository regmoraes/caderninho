import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

const DATE_TIME_FORMAT = "yyyy-MM-dd";
const DATE_TIME_TEXT_FORMAT = "d MMM y";

String formatDate(String date, {String format = DATE_TIME_TEXT_FORMAT}) {
  final dateTime = parseToDateTime(date);
  final formattedDate = DateFormat(format, 'pt_Br').format(dateTime);

  return "$formattedDate";
}

DateTime parseToDateTime(String date) {
  initializeDateFormatting();
  return DateTime.tryParse(date);
}
