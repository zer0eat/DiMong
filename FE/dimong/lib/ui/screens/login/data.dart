import 'dart:convert';
import 'package:dimong/core/domain/dino.dart';
import 'package:dimong/core/api/api.dart';
import 'package:dimong/core/utils/api_routes.dart';

class LoginApiClient {
  final dio = DataServerDio.instance();

  Future<dynamic> sendLogin() async {
    try {
      //String dinosaurEra = period!;
      //print("period: $period");
      final response = await dio.get('123');
      print("data.dart: response = $response");
      print(response.runtimeType);
      print("data.dart: response.data = ${response.data}");
      final profileJson =  response.data;
      print(profileJson);
      final sendLoginResponse = SendLoginResponse.fromJson(profileJson);
      return sendLoginResponse;
    } catch (e) {
      // Handle the error as needed
      throw e;
    }
  }
}