import 'package:intl/intl.dart';

class DateTimeConvertor {
  static String dateTimeToHour(DateTime time) {
    var t = DateFormat.jm().format(time);

    return t;
  }
  
  static String dateTimeToDate(DateTime time) {
    var t = DateFormat.yMMMd().format(time);

    return t;
  }
  
  static String dateTimeToWeekDay(DateTime time) {
    var t = DateFormat.EEEE().format(time);

    return t;
  }
}
