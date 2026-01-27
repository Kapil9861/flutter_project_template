// Shared Preferences Provider
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_template/core/services/storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider = FutureProvider<SharedPreferences>((
  ref,
) async {
  return await SharedPreferences.getInstance();
});

// Storage Service Provider (already initialized)
final storageServiceProvider = Provider<StorageService>((ref) {
  return StorageService();
});
