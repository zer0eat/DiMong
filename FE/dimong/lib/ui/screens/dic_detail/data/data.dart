import 'package:dimong/core/domain/dino.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:dimong/core/api/api.dart';
import 'package:dimong/core/utils/api_routes.dart';

class DetailApiClient {
  final dio = DataServerDio.instance();

  Future<SendInfoResponse> sendId(int? id) async {
    try {
      print("id: $id");
      final response = await dio.get(Paths.dinoDetail+'$id',
      data: {
        "dinosaurId": id
      }
      );
      print("when response in data: $response");
      print("status: ${response.statusCode}");
      print(response.runtimeType);
      final dinosaursJson =  response.data;
      print(dinosaursJson);
      final sendInfoResponse = SendInfoResponse.fromJson(dinosaursJson);
      print("sendInfoResponse: $sendInfoResponse");
      print(sendInfoResponse.runtimeType);
      return sendInfoResponse;
    } catch (e) {
      // Handle the error as needed
      throw e;
    }
  }
}