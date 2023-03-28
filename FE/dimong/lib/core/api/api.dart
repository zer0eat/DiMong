import 'dart:io';
import 'package:dio/dio.dart';
import '../auth/token_interceptor.dart';
import '../auth/auth_provider.dart';
import '../local_storage/secure_storage.dart';

AuthProvider authProvider = AuthProvider();
Future<String?> getIdToken(AuthProvider authProvider) async {
  final idToken = await SecureStorage().getIdToken();
  return idToken;
}

class ImageServerDio {
  static Dio instance() {
    final dio = Dio();

    // Set the base URL for Server 1
    //android emulator - flask 간 기본 url
    dio.options.baseUrl = 'http://10.0.2.2:5000/';
    dio.options.connectTimeout = Duration(milliseconds: 5000);
    dio.options.receiveTimeout = Duration(milliseconds: 3000);
    final idToken = getIdToken(authProvider);
    // Set up the headers for the Dio instance
    dio.options.headers = {
      HttpHeaders.contentTypeHeader:'multipart/form-data',
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $idToken',
    };

    // Add any interceptors or other configurations as needed
    //final tokenInterceptor =
    // TokenInterceptor(
    //     dio: dio, authProvider: authProvider, secureStorage: SecureStorage());
    //dio.interceptors.add(tokenInterceptor);
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler){
        return handler.next(options);
      },
      onResponse: (options, handler){
        return handler.next(options);
      },
      onError: (DioError error, handler) {
        if (error.response?.statusCode == 401) {
          authProvider.logout();
        }
        return handler.next(error);
      },
    ));
    return dio;
  }

}

class DataServerDio {
  static Dio instance() {
    final dio = Dio();

    // Set the base URL for Server 1
    dio.options.baseUrl = 'http://10.0.2.2:5000/';
    dio.options.connectTimeout = Duration(milliseconds: 5000);
    dio.options.receiveTimeout = Duration(milliseconds: 3000);
    final idToken = getIdToken(authProvider);
    // Set up the headers for the Dio instance
    dio.options.headers = {
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $idToken',
    };

    // Add any interceptors or other configurations as needed
    //final tokenInterceptor =
    // TokenInterceptor(
    //     dio: dio, authProvider: authProvider, secureStorage: SecureStorage());
    //dio.interceptors.add(tokenInterceptor);
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler){
        return handler.next(options);
      },
      onResponse: (options, handler){
        return handler.next(options);
      },
      onError: (DioError error, handler) {
        if (error.response?.statusCode == 401) {
          authProvider.logout();
        }
        return handler.next(error);
      },
    ));
    return dio;
  }

}