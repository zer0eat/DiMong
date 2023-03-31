import 'package:dimong/core/domain/dino.dart';
import 'package:dio/dio.dart';
import 'package:dimong/core/api/api.dart';
import 'package:dimong/core/utils/api_routes.dart';

class DinosaurApiClient {
  final dio = DataServerDio.instance();

  // 실시간 전송
  Future<SendDrawingResponse> sendImage(dynamic imageFile) async {
    print(imageFile.runtimeType);
    print('111111');
    try {
      final formData = FormData.fromMap({
        "userId": 1,
        "file": await MultipartFile.fromFile(imageFile.path,
            filename: 'image_camera.jpg'),
      });
      print(formData);
      final response = await dio.post(Paths.recommendThreeLive, data: formData);
      print(response);
      print(response.runtimeType);
      final dinosaursJson = response.data;
      print(dinosaursJson);
      print(dinosaursJson['dinosaurId']);
      final sendDrawingResponse = SendDrawingResponse.fromJson(dinosaursJson);
      print(sendDrawingResponse.runtimeType);
      print(sendDrawingResponse.recommendation1);
      return sendDrawingResponse;
    } catch (e) {
      // Handle the error as needed
      throw e;
    }
  }

  // 이미지 최종 저장
  Future<SendDrawingResponse> saveImage(dynamic imageFile) async {
    try {
      final formData = FormData.fromMap({
        "userId": 1,
        "file": await MultipartFile.fromFile(imageFile.path,
            filename: 'image_camera.jpg'),
      });
      print(formData);
      final response = await dio.post(Paths.recommendThree, data: formData);
      print(response);
      print(response.runtimeType);
      final dinosaursJson = response.data;
      print(dinosaursJson);
      print(dinosaursJson['dinosaurId']);
      final sendDrawingResponse = SendDrawingResponse.fromJson(dinosaursJson);
      print(sendDrawingResponse.runtimeType);
      print("하잉 ${sendDrawingResponse.recommendation1}");
      return sendDrawingResponse;
    } catch (e) {
      // Handle the error as needed
      throw e;
    }
  }
}
