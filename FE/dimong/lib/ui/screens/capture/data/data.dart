import 'dart:io';
import 'package:dimong/core/domain/dino.dart';
import 'package:dio/dio.dart';
import 'package:dimong/core/api/api.dart';
import 'package:dimong/core/utils/api_routes.dart';

class CameraApiClient {
  final dio = DataServerDio.instance();

  Future<SendImageResponse> sendImage(dynamic imageFile) async {
    print(imageFile.runtimeType);
    try {
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(imageFile.path),
        'userId': 1,
      });
      final response = await dio.post(Paths.cameraDino, data: formData);
      print(response);
      print(response.runtimeType);
      final dinosaursJson =  response.data;
      print(dinosaursJson);
      print(dinosaursJson['dinosaurId']);
      final sendImageResponse = SendImageResponse.fromJson(dinosaursJson);
      print("res: ${sendImageResponse.runtimeType}");
      print(sendImageResponse.dinosaurId);
      return sendImageResponse;
    } catch (e) {
      print("data send failed: data.dart");
      print(e);
      throw e;
    }
  }
}