import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template/core/utils/app_logger.dart';
import 'package:template/from_flutter_handler.dart';
import 'package:template/src/messages.g.dart';

import 'app.dart';
import 'core/config/app_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Set environment (change as needed)
  AppConfig.setEnvironment(Environment.dev);

  // Initialize logger
  AppLogger.i('App started in ${AppConfig.environment} mode');
  AppLogger.i('Base URL: ${AppConfig.baseUrl}');
  FromFlutter.setUp(MyFromFlutterHandler());
  debugPrint("Pigeon: FromFlutter handler is now ready!");

  runApp(const ProviderScope(child: MyApp()));
}
