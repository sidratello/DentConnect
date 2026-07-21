import 'package:intl/intl.dart';

class BookingDetailsFormatter {
  const BookingDetailsFormatter._();

  static String date(DateTime? value) {
    if (value == null) {
      return 'غير متوفر';
    }

    return DateFormat(
      'yyyy/MM/dd',
    ).format(value);
  }

  static String period(String value) {
    return value.toUpperCase() == 'AM'
        ? 'صباحاً'
        : 'مساءً';
  }
}