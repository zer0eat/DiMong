import 'package:dimong/core/domain/dino.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:dimong/core/api/api.dart';
import 'package:dimong/core/utils/api_routes.dart';
import 'package:provider/provider.dart';

import '../../../../core/auth/auth_provider.dart';

class DictionaryApiClient {
  final dio = DataServerDio.instance();

  Future<dynamic> sendPeriod() async {
    try {
      //String dinosaurEra = period!;
      //print("period: $period");

      // final authProvider = Provider.of<AuthProvider>();

      Map<String, dynamic> queryParam = {"userId": 1};

      final response = await dio.get(Paths.dinoList, queryParameters: queryParam);
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