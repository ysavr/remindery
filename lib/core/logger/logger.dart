import 'package:logger/logger.dart';

class Log {
  /// Log DEBUG
  static void d(String message,
      {DateTime? time, Object? error, StackTrace? stackTrace}) {
    var logger = Logger(
      printer: PrettyPrinter(methodCount: 3),
    );
    logger.d(message, time: time, error: error, stackTrace: stackTrace);
  }

  /// Log INFO
  static void i(
    String message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    var logger = Logger(
      printer: PrettyPrinter(methodCount: 2),
    );
    logger.i(message, time: time, error: error, stackTrace: stackTrace);
  }

  /// Log ERROR
  static void e(
    String message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    var logger = Logger(
      printer: PrettyPrinter(methodCount: 2),
    );
    logger.e(message, time: time, error: error, stackTrace: stackTrace);
  }

  /// Log FATAL
  static void f(
    String message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    var logger = Logger(
      printer: PrettyPrinter(methodCount: 2),
    );
    logger.f(message, time: time, error: error, stackTrace: stackTrace);
  }

  /// Log WARNING
  static void w(
    String message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    var logger = Logger(
      printer: PrettyPrinter(methodCount: 2),
    );
    logger.w(message, time: time, error: error, stackTrace: stackTrace);
  }

  /// Log TRACE
  static void t(
    String message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    var logger = Logger(
      printer: PrettyPrinter(methodCount: 2),
    );
    logger.t(message, time: time, error: error, stackTrace: stackTrace);
  }
}
