import 'package:dimong/core/domain/dino.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:dimong/core/api/api.dart';
import 'package:dimong/core/utils/api_routes.dart';

class MyPageApiClient {
  final dio = DataServerDio.instance();

  Future<dynamic> sendUserId(int? id) async {
    try {
      //String dinosaurEra = period!;
      //print("period: $period");
      final response = await dio.get(Paths.dinoList);
      print("data.dart: response = $response");
      print(response.runtimeType);
      print("data.dart: response.data = ${response.data}");
      final dinosaursJson =  response.data as List<dynamic>;
      print(dinosaursJson);
      final sendPeriodResponse = dinosaursJson
          .map((dinosaurJson) => SendPeriodResponse.fromJson(dinosaurJson))
          .toList();
      return sendPeriodResponse;
    } catch (e) {
      // Handle the error as needed
      throw e;
    }
  }
  Future<List<SendBadgeResponse>> sendBadge(int? id) async {
    try {
      print("id: $id");
      final response = await dio.get(Paths.badgeList+'$id',
          data: {
            "userId": 1
          }
      );
      print("when response in data: $response");
      print("status: ${response.statusCode}");
      print(response.runtimeType);
      final dinosaursJson =  response.data;
      print(dinosaursJson);
      final sendBadgeResponse= dinosaursJson.map((dinosaurJson) => SendBadgeResponse.fromJson(dinosaursJson)).toList();
      print("sendInfoResponse: $sendBadgeResponse");
      print(sendBadgeResponse.runtimeType);
      return sendBadgeResponse;
    } catch (e) {
      // Handle the error as needed
      throw e;
    }
  }
}