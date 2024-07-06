// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// class TokenStorage {
//   final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

//   static const String _accessTokenKey = 'accessToken';
//   static const String _refreshTokenKey = 'refreshToken';

//   Future<void> saveTokens(String accessToken, String refreshToken) async {
//     await _secureStorage.write(key: _accessTokenKey, value: accessToken);
//     await _secureStorage.write(key: _refreshTokenKey, value: refreshToken);
//   }

//   Future<Map<String, String?>> getTokens() async {
//     final accessToken = await _secureStorage.read(key: _accessTokenKey);
//     final refreshToken = await _secureStorage.read(key: _refreshTokenKey);
//     return {
//       'accessToken': accessToken,
//       'refreshToken': refreshToken,
//     };
//   }

//   Future<void> deleteTokens() async {
//     await _secureStorage.delete(key: _accessTokenKey);
//     await _secureStorage.delete(key: _refreshTokenKey);
//   }
// }

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppStorage {
  static final AppStorage _instance = AppStorage._();

  static AppStorage get instance => _instance;

  AppStorage._() {
    init();
  }

  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  /// Keys
  static const String TOKEN = 'access_token';
  static const String LOGIN_TIME = 'login_time';
  static const String FIRST_TIME = 'first_time';
  static const String LANGUAGE_CODE = 'language_code';
  static const String THEME = 'theme';

  Future<void> writeData(String key, dynamic value) async {
    await _secureStorage.write(key: key, value: value.toString());
  }

  Future<String?> readData(String key) async {
    return await _secureStorage.read(key: key);
  }

  Future<bool> isReadData(String key) async {
    return await _secureStorage.containsKey(key: key);
  }

  Future<void> removeData(String key) async {
    await _secureStorage.delete(key: key);
  }

  Future<void> init() async {
    // Perform any required initialization here
  }

  Future<void> dispose() async {
    await removeData(TOKEN);
    await removeData(LOGIN_TIME);
    // Uncomment if needed
    // await removeData(FIRST_TIME);
  }
}
