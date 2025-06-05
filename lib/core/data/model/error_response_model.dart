class ErrorResponseModel {
  final int code;
  final String message;
  final List<ApiError> errors;

  ErrorResponseModel({
    required this.code,
    required this.message,
    required this.errors,
  });

  // Factory method to create ApiResponse from JSON
  factory ErrorResponseModel.fromJson(Map<String, dynamic> json) {
    return ErrorResponseModel(
      code: json['code'] as int,
      message: json['message'] as String,
      errors: (json['errors'] as List)
          .map((error) => ApiError.fromJson(error as Map<String, dynamic>))
          .toList(),
    );
  }

  // Method to convert ApiResponse to JSON
  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'message': message,
      'errors': errors.map((error) => error.toJson()).toList(),
    };
  }
}

class ApiError {
  final String field;
  final String message;

  ApiError({
    required this.field,
    required this.message,
  });

  // Factory method to create ApiError from JSON
  factory ApiError.fromJson(Map<String, dynamic> json) {
    return ApiError(
      field: json['field'] as String,
      message: json['message'] as String,
    );
  }

  // Method to convert ApiError to JSON
  Map<String, dynamic> toJson() {
    return {
      'field': field,
      'message': message,
    };
  }
}
