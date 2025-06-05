import 'package:flutter/material.dart';

class TimeConverter {
  static String timeFormat(TimeOfDay time) {
    final hour = time.hour.toString().padLeft(2, '0'); // Pad with zero if needed
    final minute = time.minute.toString().padLeft(2, '0');
    return "$hour:$minute";
  }
}