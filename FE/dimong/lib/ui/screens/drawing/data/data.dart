import 'package:dimong/core/domain/dino.dart';
import 'package:dio/dio.dart';
import 'package:dimong/core/api/api.dart';
import 'package:dimong/core/utils/api_routes.dart';

class DinosaursApiClient {
  final Dio _dio;

  DinosaursApiClient({required Dio dio}) : _dio = dio;

  Future<List<SendImageResponse>> getDinosaurs() async {
    try {
      final response = await _dio.get(Paths.recommendThree);
      final dinosaursJson = response.data as List<dynamic>;
      print(dinosaursJson);
      print(dinosaursJson.runtimeType);
      final dinosaurs = dinosaursJson
          .map((dinosaurJson) => SendImageResponse.fromJson(dinosaurJson))
          .toList();
      return dinosaurs;
    } catch (e) {
      // Handle the error as needed
      throw e;
    }
  }
}