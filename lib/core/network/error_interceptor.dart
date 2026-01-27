import 'package:dio/dio.dart';
import 'package:project_template/core/utils/app_logger.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    String errorMessage = 'Unknown error occurred';

    switch (err.type) {
      case DioExceptionType.connectionTimeout:
        errorMessage =
            'Connection timeout. Please check your internet connection';
        break;
      case DioExceptionType.sendTimeout:
        errorMessage = 'Send timeout. Please try again';
        break;
      case DioExceptionType.receiveTimeout:
        errorMessage = 'Receive timeout. Server is taking too long to respond';
        break;
      case DioExceptionType.badResponse:
        errorMessage = _handleStatusCode(err.response?.statusCode);
        break;
      case DioExceptionType.cancel:
        errorMessage = 'Request was cancelled';
        break;
      case DioExceptionType.connectionError:
        errorMessage = 'No internet connection. Please check your network';
        break;
      default:
        errorMessage = 'Unexpected error occurred';
    }

    // Log the error
    AppLogger.e(
      'API Error: $errorMessage',
      error: err,
      stackTrace: err.stackTrace,
    );

    // Create custom error with user-friendly message
    final customError = DioException(
      requestOptions: err.requestOptions,
      error: errorMessage,
      type: err.type,
      response: err.response,
    );

    handler.next(customError);
  }

  String _handleStatusCode(int? statusCode) {
    switch (statusCode) {
      case 400:
        return 'Bad request. Please check your input';
      case 401:
        return 'Unauthorized. Please login again';
      case 403:
        return 'Access forbidden. You don\'t have permission';
      case 404:
        return 'Resource not found';
      case 408:
        return 'Request timeout';
      case 409:
        return 'Conflict occurred';
      case 422:
        return 'Validation error. Please check your input';
      case 429:
        return 'Too many requests. Please try again later';
      case 500:
        return 'Internal server error. Please try again later';
      case 502:
        return 'Bad gateway. Server is unavailable';
      case 503:
        return 'Service unavailable. Please try again later';
      case 504:
        return 'Gateway timeout. Server is not responding';
      default:
        return 'Server error occurred (${statusCode ?? 'Unknown'})';
    }
  }
}
