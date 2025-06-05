class AppException implements Exception {
  int? code;
  final String message;
  final Map<String, String> errorMap;

  AppException({
    this.code,
    required this.message,
    required this.errorMap,
  });
}
