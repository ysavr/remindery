import 'package:intl/intl.dart';

class DateFormatCore {
  DateTime currentDate = DateTime.now();
  final DateFormat formatterDate = DateFormat('d MMMM yyyy');
  final formatterDateStandart = DateFormat("yyyy-MM-dd");


  String getCurrentDateFull() {
    return DateFormat('EEEE, d MMMM yyyy').format(DateTime.now());
  }

  String getCurrentDateOnly(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  String getYears() {
    return DateFormat('yyyy').format(DateTime.now());
  }

  String daysBetween(DateTime from, DateTime to) {
    Duration difference = to.difference(from);
    String hours = '00:';
    String minutes = '00:';
    String seconds = '00';
    if (difference.inHours < 10) {
      hours = '0${difference.inHours.toString()}:';
    } else {
      hours = '${difference.inHours}:';
    }
    if (difference.inMinutes % 60 < 10) {
      minutes = '0${(difference.inMinutes % 60).toString()}:';
    } else {
      minutes = '${difference.inMinutes % 60}:';
    }
    if (difference.inSeconds % 60 < 10) {
      seconds = '0${(difference.inSeconds % 60).toString()}';
    } else {
      seconds = (difference.inSeconds % 60).toString();
    }
    String timer = '$hours$minutes$seconds';
    return timer;
  }

  String convertZoneDate(String date, {required String pattern}) {
    if (date.isEmpty) return '';
    DateTime dateTime = DateTime.parse(date);
    String formattedDate = DateFormat(pattern).format(dateTime);
    return formattedDate;
  }

  String convertToZoneFormat(DateTime? date, {required String pattern}) {
    if (date == null) return '';
    String formattedDate = DateFormat(pattern).format(date);
    return formattedDate;
  }

  String convertTime(String timeString) {
    if (timeString.isEmpty) return '';
    DateTime parsedTime = DateFormat('HH:mm:ss').parse(timeString);
    String formattedTime = DateFormat('HH:mm').format(parsedTime);
    return formattedTime;
  }
}

extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}
