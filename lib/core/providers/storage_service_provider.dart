// Shared Preferences Provider
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:template/core/services/storage_service.dart';

final sharedPreferencesProvider = FutureProvider<SharedPreferences>((
  ref,
) async {
  return await SharedPreferences.getInstance();
});

// Storage Service Provider (already initialized)
final storageServiceProvider = Provider<StorageService>((ref) {
  return StorageService();
});
