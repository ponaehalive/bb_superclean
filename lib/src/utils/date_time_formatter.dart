import 'package:intl/intl.dart';

class AppFormatter {
  static String format(DateTime date, String format) {
    return DateFormat(format).format(date.toLocal());
  }

  static const String birthdayFormat = 'dd/MM/yyyy';
  static const String yearFormat = 'yyyy';
  static const String airdateFormat = 'd MMMM ' 'yyyy';
}
