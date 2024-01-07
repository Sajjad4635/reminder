import 'package:intl/intl.dart';

class DateTimeConvertor {
  static String dateTimeToHour(DateTime time) {
    var t = DateFormat.jm().format(time);

    return t;
  }
}
