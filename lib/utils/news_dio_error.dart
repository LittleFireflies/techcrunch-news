import 'package:dio/dio.dart';

class NewsDioError extends DioError {
  final String errorMessage;
  final Map<String, List<String>> errors;

  int get status => response?.statusCode ?? 0;

  NewsDioError._(DioError err, this.errorMessage, this.errors)
      : super(
          requestOptions: err.requestOptions,
          error: err.error,
          response: err.response,
          type: err.type,
        );

  @override
  String toString() => errorMessage;

  factory NewsDioError.fromError({
    required DioError err,
    required String errorMessage,
    Map<String, List<String>> errors = const {},
  }) =>
      NewsDioError._(err, errorMessage, errors);
}
