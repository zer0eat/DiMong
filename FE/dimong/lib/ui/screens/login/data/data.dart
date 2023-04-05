import 'package:dimong/core/domain/dino.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:dimong/core/api/api.dart';
import 'package:dimong/core/utils/api_routes.dart';

class LoginApiClient {
  final dio = DataServerDio.instance();

  Future<SendIdResponse> sendId(SendProfileRequest _sendProfileRequest) async {
    try {
      print("request data: $_sendProfileRequest");
      print("request data type: $_sendProfileRequest");
      final response = await dio.get(Paths.sendProfile+'google',
          data: _sendProfileRequest
      );
      print("when response in data: $response");
      print("status: ${response.statusCode}");
      print(response.runtimeType);
      final dinosaursJson =  response.data;
      print(dinosaursJson);
      final sendIdResponse = SendIdResponse.fromJson(dinosaursJson);
      print("sendInfoResponse: $sendIdResponse");
      print(sendIdResponse.runtimeType);
      return sendIdResponse;
    } catch (e) {
      // Handle the error as needed
      print("login to Spring server 오류");
      throw e;
    }
  }

}