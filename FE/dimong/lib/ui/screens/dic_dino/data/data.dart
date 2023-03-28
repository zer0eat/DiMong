import 'package:dimong/core/domain/dino.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:dimong/core/api/api.dart';
import 'package:dimong/core/utils/api_routes.dart';

class DictionaryApiClient {
  final dio = DataServerDio.instance();

  Future<List<SendPeriodResponse>> sendPeriod(String? period) async {
    try {
      final response = await dio.get(Paths.dinoList);
      print(response);
      print(response.runtimeType);
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