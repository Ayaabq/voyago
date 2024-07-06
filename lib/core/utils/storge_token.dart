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
