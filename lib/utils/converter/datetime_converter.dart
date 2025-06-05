import 'package:intl/intl.dart';

class DatetimeConverter {
  static String datetimeToDDMMMYYY(DateTime time) {
    DateFormat inputFormat = DateFormat('dd MMM yyyy, HH:mm');
    return inputFormat.format(time);
  }

  static String datetimeToDDMMMYYYHHMMSS(DateTime time) {
    DateFormat inputFormat = DateFormat('ddMMyyyy_HHmmss');
    return inputFormat.format(time);
  }
}