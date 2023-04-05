import 'package:dimong/core/domain/dino.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:dimong/core/api/api.dart';
import 'package:dimong/core/utils/api_routes.dart';

class GalleryApiClient {
  final dio = DataServerDio.instance();

  Future<dynamic> sendList() async {
    try {
      //String dinosaurEra = period!;
      //print("period: $period");
      final userId = 1;
      final response = await dio.get(Paths.myInfo+'$userId',
      data:{
        "userId": userId,
      }
      );
      print("data.dart: response = $response");
      print(response.runtimeType);
      print("data.dart: response.data = ${response.data}");
      final dinosaursJson =  response.data;
      print(dinosaursJson);
      final sendProfileResponse = SendProfileResponse.fromJson(dinosaursJson);
      return sendProfileResponse;
    } catch (e) {
      // Handle the error as needed
      throw e;
    }
  }
}