import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import '../domain/dino.dart';
import '../api/api.dart';
import '../api/rest_client.dart';
import '../auth/auth_provider.dart';

class DioService {
  late AuthProvider authProvider;
  late RestClient restClient;
  DioService() {
    authProvider = AuthProvider();
    restClient = RestClient(dio, authProvider);
  }
  Future<int?> sendImage(dynamic imageFile) async {
    print(imageFile.runtimeType);
    print(imageFile.path.runtimeType);
    dio.options.headers = {"media-type": "multipart/form-data"};
    try {
      FormData formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(
          imageFile.path,
          filename: DateTime.now().toIso8601String(),
        )
      });
      print(formData.runtimeType);
      var request = jsonEncode(formData.fields);
      SendImageResponse response = await restClient.postCameraDino(request);
      Map<String, dynamic> json = response.toJson();
      print(json);
      return json['dinosaurId'];
      print(response);
    } catch (e, stackTrace) {
      print(e);
      print('Stack trace: $stackTrace');
    }
  }
  // period 보내면 정보 가져오기
  Future<Map<String,dynamic>?> sendPeriod(String period) async {
    try {
      SendPeriodResponse response = await restClient.getDinosaurs(period);
      Map<String, dynamic> json = response.toJson();
      print("response: $json");
      print(json['dinosaurId']);
      return json;
    } catch (e, stackTrace) {
      print(e);
      print('Stack trace: $stackTrace');
    }
  }
}
