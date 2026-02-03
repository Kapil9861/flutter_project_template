import '../constants/api_constants.dart';

enum Environment { dev, staging, prod }

class AppConfig {
  static Environment _environment = Environment.dev;

  static Environment get environment => _environment;

  static String get baseUrl {
    switch (_environment) {
      case Environment.dev:
        return ApiConstants.baseUrlDev;
      case Environment.staging:
        return ApiConstants.baseUrlStaging;
      case Environment.prod:
        return ApiConstants.baseUrlProd;
    }
  }

  static bool get isDevelopment => _environment == Environment.dev;
  static bool get isProduction => _environment == Environment.prod;

  static void setEnvironment(Environment env) {
    _environment = env;
  }
}
