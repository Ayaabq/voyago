import 'package:intl/intl.dart';

class DateTimeHelper{
  static String formatDateDMMM(DateTime date) {
    return DateFormat('d MMM').format(date);
  }
  static String formatDateMMMDY(DateTime date) {
    return DateFormat('MMM d, y').format(date);
  }
}