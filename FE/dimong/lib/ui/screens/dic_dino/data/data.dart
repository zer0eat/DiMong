import 'package:dimong/core/domain/dino.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:dimong/core/api/api.dart';
import 'package:dimong/core/utils/api_routes.dart';

class DictionaryApiClient {
  final dio = ImageServerDio.instance();

  Future<List<SendPeriodResponse>> sendPeriod(String period) async {
    try {
      // final formData = FormData.fromMap({
      //   'name': 'image',
      //   'date': DateTime.now().toIso8601String(),
      //   'file': await MultipartFile.fromFile(imageFile.path, filename: 'image_camera.jpg'),
      // });
      final response = await dio.get(Paths.dinoList, );
      print(response);
      print(response.runtimeType);
      final dinosaursJson =  response.data;
      print(dinosaursJson);
      final dinosaurId = dinosaursJson['dinosaurId'];
      print(dinosaurId);
      return dinosaurId;
    } catch (e) {
      // Handle the error as needed
      throw e;
    }
  }
}