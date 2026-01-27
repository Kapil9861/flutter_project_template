class ApiConstants {
  // Base URLs
  static const String baseUrlDev = 'https://api-dev.example.com';
  static const String baseUrlStaging = 'https://api-staging.example.com';
  static const String baseUrlProd = 'https://api.example.com';

  // Timeouts
  static const Duration connectionTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
  static const Duration sendTimeout = Duration(seconds: 30);

  // API Endpoints
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String logout = '/auth/logout';
  static const String refreshToken = '/auth/refresh';
  static const String profile = '/user/profile';
  static const String updateProfile = '/user/profile/update';

  // Headers
  static const String contentType = 'application/json';
  static const String authorization = 'Authorization';
  static const String bearer = 'Bearer';
  static const String contentTypeKey = 'Content-Type';
  static const String acceptHeaderKey = 'Accept';
}
