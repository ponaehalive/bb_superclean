import 'package:intl/intl.dart';

class AppFormatter {
  static String format(DateTime date, String format) {
    return DateFormat(format).format(date.toLocal());
  }

  static const String BIRTHDAY_FORMAT = 'dd/MM/yyyy';
  static const String YEAR_FORMAT = 'yyyy';
  static const String AIRDATE_FORMAT = 'd MMMM ' 'yyyy';
}
