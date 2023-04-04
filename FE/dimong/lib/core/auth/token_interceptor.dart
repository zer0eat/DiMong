import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'auth_provider.dart';
import '../local_storage/secure_storage.dart';

class TokenInterceptor extends Interceptor {
  final Dio dio;
  final AuthProvider authProvider;
  final SecureStorage secureStorage;

  String? _refreshToken;
  bool _isRefreshingToken = false;
  Completer<String>? _refreshTokenCompleter;

  TokenInterceptor({
    required this.dio,
    required this.authProvider,
    required this.secureStorage,
    String? refreshToken,
  }) : _refreshToken = refreshToken;

  // request를 보내기 전, token 검증
  @override
  FutureOr onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final idToken = await authProvider.getIdToken();

    if (idToken != null) {
      options.headers[HttpHeaders.authorizationHeader] = 'Bearer $idToken';
    }
    return handler.next(options);
  }

  // request 중, error 발생시,
  @override
  FutureOr onError(DioError err, ErrorInterceptorHandler handler) async {
    if (_isTokenExpiredError(err)) {
      // If the error is due to an expired token, refresh the token and retry the request
      final newToken = await _refreshTokenAsync();

      if (newToken != null) {
        // Retry the request with the new token
        final request = err.requestOptions;
        request.headers[HttpHeaders.authorizationHeader] = 'Bearer $newToken';
        return dio.request(request.path, options: Options(headers: request.headers));
      }
    }

    return handler.next(err);
  }

  bool _isTokenExpiredError(DioError error) {
    final statusCode = error.response?.statusCode;
    return statusCode == HttpStatus.unauthorized || statusCode == HttpStatus.forbidden;
  }

  Future<String> _refreshTokenAsync() async {
    if (_isRefreshingToken) {
      // If a token refresh is already in progress, wait for it to complete
      return await _refreshTokenCompleter!.future;
    }
    _isRefreshingToken = true;
    final refreshToken = _refreshToken ?? await secureStorage.getRefreshToken();
    final completer = Completer<String>();

    // Refresh the token
    try {
      final response = await dio.post('/auth/refresh_token', data: {'refreshToken': refreshToken});

      if (response.statusCode == HttpStatus.ok) {
        final jsonResponse = jsonDecode(response.data);
        final newToken = jsonResponse['idToken'];
        final newRefreshToken = jsonResponse['refreshToken'];

        await authProvider.setIdToken(newToken);
        await secureStorage.setRefreshToken(newRefreshToken);

        _refreshToken = newRefreshToken;
        completer.complete(newToken);
      }
    } catch (e) {
      print(e);
    } finally {
      _isRefreshingToken = false;
    }

    _refreshTokenCompleter = completer;
    return await completer.future;
  }
}
