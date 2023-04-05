import 'package:dio/dio.dart';
import 'package:dimong/core/api/api.dart';
import 'package:dimong/core/domain/dino.dart';
import 'package:dimong/core/utils/api_routes.dart';
import 'package:dimong/core/local_storage/secure_storage.dart';

class DinosaurApiClient {
  final dio = DataServerDio.instance();
  SecureStorage _secureStorage = SecureStorage();
  Map<String, dynamic> nullValue = {
    "recommendation1": null,
    "recommendation2": null,
    "recommendation3": null,
  };

  // 실시간 전송
  Future sendImage(dynamic imageFile) async {
    print("실시간 통신중");
    final accessToken = await _secureStorage.getRefreshToken(); // get the access token from Secure Storage or SharedPreferences
    dio.options.headers['Authorization'] = 'Bearer $accessToken';
    final userId = await _secureStorage.getUserId();
    try {
      final formData = FormData.fromMap({
        "userId": userId,
        "file": await MultipartFile.fromFile(imageFile.path,
            filename: 'free_image.jpg'),
      });
      final response = await dio.post(Paths.recommendThreeLive, data: formData);
      // if (response.data["found"] == false) {
      //   return null;
      // } else {
      print('[실시간] 이미지 보내서 데이터 받아옴! ${response.data}');
      print(response.data["similarDinosaurList"]);
      // print(response.runtimeType);

      if (response.data["found"] == true) {
        print("[실시간] found가 true일 때");
        final dinosaursJson = response.data["similarDinosaurList"];
        print(dinosaursJson);
        Map<String, dynamic> map = {};
        for (num i = 0; i < 3; i++) {
          map['recommendation${i + 1}'] = dinosaursJson[i];
        }
        final sendImageResponse = SendImageResponse.fromJson(map);
        // final dinosaursJson = response.data["similarDinosaurList"];
        print(sendImageResponse);
        // print(sendImageResponse.runtimeType);
        final sendDrawingResponse = SendDrawingResponse.fromJson(map);
        print(sendDrawingResponse.recommendation1);
        print('실시간 통신 끝!');
        return sendDrawingResponse;
      } else {
        final sendDrawingResponse = SendDrawingResponse.fromJson(nullValue);
        return sendDrawingResponse;
      }
      // }
    } catch (e) {
      // Handle the error as needed
      throw e;
    }
  }

  // 이미지 최종 저장
  Future saveImage(dynamic imageFile) async {
    try {
      print("저장 시도중");
      final userId = await _secureStorage.getUserId();
      final formData = FormData.fromMap({
        "userId": userId,
        "file": await MultipartFile.fromFile(imageFile.path,
            filename: 'free_image.jpg'),
      });
      final response = await dio.post(Paths.recommendThree, data: formData);
      print("[저장] 이미지 보내서 데이터 받아옴! ${response.data}");
      print(response.data["similarDinosaurList"]);

      if (response.data["found"] == true) {
        print("[저장] found가 true일 때");
        final dinosaursJson = response.data["similarDinosaurList"];
        print(dinosaursJson);
        Map<String, dynamic> map = {};
        for (num i = 0; i < 3; i++) {
          map['recommendation${i + 1}'] = dinosaursJson[i];
        }
        final sendImageResponse = SendImageResponse.fromJson(map);
        // final dinosaursJson = response.data["similarDinosaurList"];
        print(sendImageResponse);
        // print(sendImageResponse.runtimeType);
        final sendDrawingResponse = SendDrawingResponse.fromJson(map);
        print(sendDrawingResponse.recommendation1);
        print('저장 통신 끝! ');
        return sendDrawingResponse;
      } else {
        final sendDrawingResponse = SendDrawingResponse.fromJson(nullValue);
        return sendDrawingResponse;
      }
      //
      // final dinosaursJson = response.data;
      // print(dinosaursJson);
      // print(dinosaursJson['dinosaurId']);
      // final sendImageResponse = SendImageResponse.fromJson(dinosaursJson);
      // print(sendImageResponse.runtimeType);
      // // print("하잉 ${sendDrawingResponse.recommendation1}");
      // return sendImageResponse;
    } catch (e) {
      // Handle the error as needed
      throw e;
    }
  }
}
