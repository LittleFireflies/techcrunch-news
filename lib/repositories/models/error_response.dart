import 'package:equatable/equatable.dart';

class ErrorResponse extends Equatable {
  ErrorResponse({
    required this.status,
    required this.code,
    required this.message,
  });

  final String status;
  final String code;
  final String message;

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => ErrorResponse(
        status: json["status"],
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
      };

  @override
  List<Object?> get props => [status, code, message];
}
