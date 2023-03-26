import 'package:dio/dio.dart';

final dio = Dio(BaseOptions(
  baseUrl: 'http://10.0.2.2:5000/',
  connectTimeout: Duration(milliseconds: 3000),
  receiveTimeout: Duration(milliseconds: 3000),
));