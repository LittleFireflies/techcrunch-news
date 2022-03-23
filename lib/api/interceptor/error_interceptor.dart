import 'package:dio/dio.dart';
import 'package:tech_crunch_news/api/models/error_response.dart';
import 'package:tech_crunch_news/utils/news_dio_error.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.type == DioErrorType.response) {
      final response = err.response;
      if (response == null) {
        final error = _createGenericError(err);
        super.onError(error, handler);
      } else {
        try {
          final responseData = response.data as Map<String, dynamic>;
          final error = ErrorResponse.fromJson(responseData);
          final newsError = NewsDioError.fromError(
            err: err,
            errorMessage: error.message,
          );
          super.onError(newsError, handler);
        } on TypeError {
          final error = _createGenericError(err);
          super.onError(error, handler);
        }
      }
    } else if (err.type == DioErrorType.connectTimeout) {
      final error = _createTimeOutError(err);
      super.onError(error, handler);
    } else if (err.type == DioErrorType.sendTimeout) {
      final error = _createTimeOutError(err);
      super.onError(error, handler);
    } else if (err.type == DioErrorType.receiveTimeout) {
      final error = _createTimeOutError(err);
      super.onError(error, handler);
    } else {
      final error = _createGenericError(err);
      super.onError(error, handler);
    }
  }

  NewsDioError _createTimeOutError(DioError err) {
    return NewsDioError.fromError(
      err: err,
      errorMessage: ErrorMessage.connectionError,
    );
  }

  NewsDioError _createGenericError(DioError err) {
    return NewsDioError.fromError(
      err: err,
      errorMessage: ErrorMessage.genericError,
    );
  }
}

class ErrorMessage {
  static const genericError =
      'Something went wrong. Please try again or contact the developer';
  static const connectionError = 'Connection timed out';
}
