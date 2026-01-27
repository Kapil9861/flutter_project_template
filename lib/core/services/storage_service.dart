import 'package:shared_preferences/shared_preferences.dart';

/// Storage service using SharedPreferences
/// Use this for non-sensitive data like user preferences, settings, etc.
/// For sensitive data like tokens, consider using FlutterSecureStorage
class StorageService {
  static SharedPreferences? _prefs;

  // Initialize SharedPreferences
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Get SharedPreferences instance
  static SharedPreferences get instance {
    if (_prefs == null) {
      throw Exception('StorageService not initialized. Call init() first.');
    }
    return _prefs!;
  }

  // ============================================
  // STRING OPERATIONS
  // ============================================

  static Future<bool> setString(String key, String value) async {
    return await instance.setString(key, value);
  }

  static String? getString(String key, {String? defaultValue}) {
    return instance.getString(key) ?? defaultValue;
  }

  // ============================================
  // INT OPERATIONS
  // ============================================

  static Future<bool> setInt(String key, int value) async {
    return await instance.setInt(key, value);
  }

  static int? getInt(String key, {int? defaultValue}) {
    return instance.getInt(key) ?? defaultValue;
  }

  // ============================================
  // BOOL OPERATIONS
  // ============================================

  static Future<bool> setBool(String key, bool value) async {
    return await instance.setBool(key, value);
  }

  static bool? getBool(String key, {bool? defaultValue}) {
    return instance.getBool(key) ?? defaultValue;
  }

  // ============================================
  // DOUBLE OPERATIONS
  // ============================================

  static Future<bool> setDouble(String key, double value) async {
    return await instance.setDouble(key, value);
  }

  static double? getDouble(String key, {double? defaultValue}) {
    return instance.getDouble(key) ?? defaultValue;
  }

  // ============================================
  // LIST OPERATIONS
  // ============================================

  static Future<bool> setStringList(String key, List<String> value) async {
    return await instance.setStringList(key, value);
  }

  static List<String>? getStringList(String key) {
    return instance.getStringList(key);
  }

  // ============================================
  // REMOVE & CLEAR
  // ============================================

  static Future<bool> remove(String key) async {
    return await instance.remove(key);
  }

  static Future<bool> clear() async {
    return await instance.clear();
  }

  // ============================================
  // CHECK & GET ALL KEYS
  // ============================================

  static bool containsKey(String key) {
    return instance.containsKey(key);
  }

  static Set<String> getAllKeys() {
    return instance.getKeys();
  }

  // ============================================
  // TOKEN MANAGEMENT (for auth tokens)
  // ============================================

  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';

  static Future<bool> saveAccessToken(String token) async {
    return await setString(_accessTokenKey, token);
  }

  static String? getAccessToken() {
    return getString(_accessTokenKey);
  }

  static Future<bool> saveRefreshToken(String token) async {
    return await setString(_refreshTokenKey, token);
  }

  static String? getRefreshToken() {
    return getString(_refreshTokenKey);
  }

  static Future<bool> clearTokens() async {
    await remove(_accessTokenKey);
    await remove(_refreshTokenKey);
    return true;
  }

  // ============================================
  // USER DATA MANAGEMENT
  // ============================================

  static const String _userIdKey = 'user_id';
  static const String _userNameKey = 'user_name';
  static const String _userEmailKey = 'user_email';
  static const String _isLoggedInKey = 'is_logged_in';

  static Future<bool> saveUserId(String userId) async {
    return await setString(_userIdKey, userId);
  }

  static String? getUserId() {
    return getString(_userIdKey);
  }

  static Future<bool> saveUserName(String name) async {
    return await setString(_userNameKey, name);
  }

  static String? getUserName() {
    return getString(_userNameKey);
  }

  static Future<bool> saveUserEmail(String email) async {
    return await setString(_userEmailKey, email);
  }

  static String? getUserEmail() {
    return getString(_userEmailKey);
  }

  static Future<bool> setLoggedIn(bool isLoggedIn) async {
    return await setBool(_isLoggedInKey, isLoggedIn);
  }

  static bool isLoggedIn() {
    return getBool(_isLoggedInKey, defaultValue: false) ?? false;
  }

  static Future<bool> clearUserData() async {
    await remove(_userIdKey);
    await remove(_userNameKey);
    await remove(_userEmailKey);
    await remove(_isLoggedInKey);
    return true;
  }

  // ============================================
  // SETTINGS MANAGEMENT
  // ============================================

  static const String _themeKey = 'theme_mode';
  static const String _languageKey = 'language';
  static const String _notificationsKey = 'notifications_enabled';

  static Future<bool> saveThemeMode(String mode) async {
    return await setString(_themeKey, mode);
  }

  static String? getThemeMode() {
    return getString(_themeKey);
  }

  static Future<bool> saveLanguage(String language) async {
    return await setString(_languageKey, language);
  }

  static String? getLanguage() {
    return getString(_languageKey);
  }

  static Future<bool> setNotificationsEnabled(bool enabled) async {
    return await setBool(_notificationsKey, enabled);
  }

  static bool getNotificationsEnabled() {
    return getBool(_notificationsKey, defaultValue: true) ?? true;
  }

  // ============================================
  // LOGOUT (Clear all user data)
  // ============================================

  static Future<void> logout() async {
    await clearTokens();
    await clearUserData();
    // Keep settings like language and theme
  }
}
