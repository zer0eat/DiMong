import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final _storage = FlutterSecureStorage();
  static const _idTokenKey = 'idToken';
  static const _accessTokenKey = 'accessToken';
  static const _refreshTokenKey = 'refreshToken';
  static const _userIdKey = 'userId';

  Future<void> setIdToken(String? idToken) async {
    await _storage.write(key: _idTokenKey, value: idToken);
  }

  Future<String?> getIdToken() async {
    final idToken = await _storage.read(key: _idTokenKey);
    return idToken;
  }

  Future<void> deleteIdToken() async {
    await _storage.delete(key: _idTokenKey);
  }

  Future<void> setAccessToken(String? accessToken) async {
    await _storage.write(key: _accessTokenKey, value: accessToken);
  }

  Future<String?> getAccessToken() async {
    final accessToken = await _storage.read(key: _accessTokenKey);
    return accessToken;
  }

  Future<void> deleteAccessToken() async {
    await _storage.delete(key: _accessTokenKey);
  }

  Future<void> setRefreshToken(String? refreshToken) async {
    await _storage.write(key: _refreshTokenKey, value: refreshToken);
  }

  Future<String?> getRefreshToken() async {
    final refreshToken = await _storage.read(key: _refreshTokenKey);
    return refreshToken;
  }

  Future<void> deleteRefreshToken() async {
    await _storage.delete(key: _refreshTokenKey);
  }

  Future<void> setUserId(int? userId) async {
    String userIdStr = userId.toString();
    await _storage.write(key: _userIdKey, value: userIdStr);
  }

  Future<int> getUserId() async {
    final String? userIdStr = await _storage.read(key: _userIdKey);
    if(userIdStr == null) return -1;
    int userId = int.tryParse(userIdStr!) ?? -1;
    return userId;
  }
}
