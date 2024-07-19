import 'package:intl/intl.dart';

class DateTimeHelper{
  static String formatDate(DateTime date) {
    return DateFormat('d MMM').format(date);
  }
}