import 'package:dio/dio.dart';
import 'package:project_template/core/constants/api_constants.dart';
import 'package:project_template/core/services/storage_service.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor();

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Get token from SharedPreferences
    final token = StorageService.getAccessToken();

    // Add authorization header if token exists
    if (token != null && token.isNotEmpty) {
      options.headers[ApiConstants.authorization] =
          '${ApiConstants.bearer} $token';
    }

    // Add default headers
    options.headers[ApiConstants.contentType] = ApiConstants.contentType;
    options.headers[ApiConstants.acceptHeaderKey] = ApiConstants.contentType;

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // Handle 401 Unauthorized - Token expired
    if (err.response?.statusCode == 401) {
      try {
        // Attempt to refresh token
        final refreshed = await _refreshToken();

        if (refreshed) {
          // Retry the original request
          final options = err.requestOptions;
          final token = StorageService.getAccessToken();
          options.headers[ApiConstants.authorization] =
              '${ApiConstants.bearer} $token';

          final dio = Dio();
          final response = await dio.fetch(options);
          return handler.resolve(response);
        }
      } catch (e) {
        // Token refresh failed, clear tokens and redirect to login
        await _clearTokens();
      }
    }

    handler.next(err);
  }

  Future<bool> _refreshToken() async {
    try {
      final refreshToken = StorageService.getRefreshToken();

      if (refreshToken == null) return false;

      final dio = Dio();
      final response = await dio.post(
        '${ApiConstants.baseUrlDev}${ApiConstants.refreshToken}',
        data: {'refresh_token': refreshToken},
      );

      if (response.statusCode == 200) {
        final newAccessToken = response.data['access_token'];
        final newRefreshToken = response.data['refresh_token'];

        await StorageService.saveAccessToken(newAccessToken);
        await StorageService.saveRefreshToken(newRefreshToken);

        return true;
      }

      return false;
    } catch (e) {
      return false;
    }
  }

  Future<void> _clearTokens() async {
    await StorageService.clearTokens();
  }
}
