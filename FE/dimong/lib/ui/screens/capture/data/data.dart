import 'package:dio/dio.dart';
import 'package:dimong/core/api/api.dart';
import 'package:dimong/core/domain/dino.dart';
import 'package:dimong/core/utils/api_routes.dart';
import 'package:dimong/core/local_storage/secure_storage.dart';

class CameraApiClient {
  final dio = DataServerDio.instance();
  SecureStorage _secureStorage = SecureStorage();

  Future<SendImageResponse> sendImage(dynamic imageFile) async {
    print(imageFile.runtimeType);
    final userId = await _secureStorage.getUserId();
    try {
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(imageFile.path),
        'userId': userId,
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