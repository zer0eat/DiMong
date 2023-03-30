import 'package:dimong/core/domain/dino.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:dimong/core/api/api.dart';
import 'package:dimong/core/utils/api_routes.dart';

class MyPageApiClient {
  final dio = DataServerDio.instance();

  Future<dynamic> sendUserId() async {
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
}