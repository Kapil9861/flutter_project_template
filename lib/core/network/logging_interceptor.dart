import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:template/core/config/app_config.dart';

class LoggingInterceptor {
  static Interceptor get instance {
    return PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
      enabled: AppConfig.isDevelopment, // Only log in development
      filter: (options, args) {
        // Don't log specific endpoints (e.g., sensitive data)
        return !options.path.contains('password') &&
            !options.path.contains('token');
      },
    );
  }
}
