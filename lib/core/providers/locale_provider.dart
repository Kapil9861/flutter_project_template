import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Locale provider for managing app language
final localeProvider = StateNotifierProvider<LocaleNotifier, Locale>((ref) {
  return LocaleNotifier(ref);
});

class LocaleNotifier extends StateNotifier<Locale> {
  final Ref ref;
  static const String _languageKey = 'selected_language';

  LocaleNotifier(this.ref) : super(const Locale('en')) {
    _loadSavedLanguage();
  }

  // Load saved language from SharedPreferences
  Future<void> _loadSavedLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final savedLanguage = prefs.getString(_languageKey);

    if (savedLanguage != null) {
      state = Locale(savedLanguage);
    }
  }

  // Change language and save to SharedPreferences
  Future<void> changeLanguage(String languageCode) async {
    state = Locale(languageCode);

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageKey, languageCode);
  }

  // Quick methods for common languages
  Future<void> setEnglish() => changeLanguage('en');
  Future<void> setNepali() => changeLanguage('ne');
}

// Helper method to change language (use this in your UI)
extension LocaleX on WidgetRef {
  Future<void> changeLanguage(String languageCode) async {
    await read(localeProvider.notifier).changeLanguage(languageCode);
  }

  Future<void> setEnglish() async {
    await read(localeProvider.notifier).setEnglish();
  }

  Future<void> setNepali() async {
    await read(localeProvider.notifier).setNepali();
  }
}
