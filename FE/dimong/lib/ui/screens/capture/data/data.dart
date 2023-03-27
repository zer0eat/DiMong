import 'dart:io';

import 'package:dimong/core/domain/dino.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:dimong/core/api/api.dart';
import 'package:dimong/core/utils/api_routes.dart';

class CameraApiClient {
  final dio = ImageServerDio.instance();

  Future<SendImageResponse> sendImage(dynamic imageFile) async {
    print(imageFile.runtimeType);
    try {
      final formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(imageFile.path, filename: 'image_camera.jpg'),
      });
      final response = await dio.post(Paths.cameraDino, data: formData);
      print(response);
      print(response.runtimeType);
      final dinosaursJson =  response.data;
      print(dinosaursJson);
      print(dinosaursJson['dinosaurId']);
      final sendImageResponse = SendImageResponse.fromJson(dinosaursJson);
      print(sendImageResponse.runtimeType);
      print(sendImageResponse.dinosaurId);
      return sendImageResponse;
    } catch (e) {
      // Handle the error as needed
      throw e;
    }
  }
}