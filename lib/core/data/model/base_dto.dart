import 'package:equatable/equatable.dart';

class BaseDto extends Equatable {
  final int code;
  final String message;

  const BaseDto({
    required this.code,
    required this.message,
  });

  factory BaseDto.fromJson(Map<String, dynamic> json) {
    try {
      return BaseDto(
        code: json['code'] as int,
        message: json['message'] as String,
      );
    } catch (e) {
      throw Exception('failed to convert json');
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'message': message,
    };
  }

  @override
  List<Object?> get props => [code, message];
}
