// Dio Client Provider (no longer needs secure storage)
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template/core/network/dio_client.dart';

final dioClientProvider = Provider<DioClient>((ref) {
  return DioClient();
});
