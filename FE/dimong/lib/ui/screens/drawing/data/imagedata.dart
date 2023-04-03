import 'package:dimong/core/domain/dino.dart';
import 'package:dio/dio.dart';
import 'package:dimong/core/api/api.dart';
import 'package:dimong/core/utils/api_routes.dart';

class DinosaurApiClient {
  final dio = DataServerDio.instance();

  // 실시간 전송
  Future sendImage(dynamic imageFile) async {
    print(imageFile.path);
    try {
      final formData = FormData.fromMap({
        "userId": 1,
        "file": await MultipartFile.fromFile(imageFile.path,
            filename: 'free_image.jpg'),
      });
      print(formData);

      final response = await dio.post(Paths.recommendThreeLive, data: formData);
      // if (response.data["found"] == false) {
      //   return null;
      // } else {
      print('res: ${response.data}');

      print(response.runtimeType);
      if (response.data["found"] == true) {
        final dinosaursJson = response.data["similarDinosaurList"];
        print(dinosaursJson);
        Map<String, dynamic> map = {};
        for (num i = 0; i < 3; i++) {
          map['recommendation${i + 1}'] = dinosaursJson[i];
        }
        print("잘 들어가써?$map");

        print(map.runtimeType);
        final sendImageResponse = SendImageResponse.fromJson(map);
        // final dinosaursJson = response.data["similarDinosaurList"];
        print(sendImageResponse);
        print(sendImageResponse.runtimeType);
        final sendDrawingResponse = SendDrawingResponse.fromJson(map);
        print(sendDrawingResponse.recommendation1);
        // print(dinosaursJson.runtimeType);
        // print(dinosaursJson['dinosaurId']);
        // Map<dynamic, dynamic> map = dinosaursJson
        //     .fold({}, (previous, current) => previous..addAll(current));

        // Map<String, dynamic> map =
        //     Map.fromEntries(dinosaursJson.expand((element) => element.entries));
        // print('map 변환 잘 됐나 $map');
        // return sendImageResponse;
        return sendDrawingResponse;
      } else {
        return response.data;
      }
      // }
    } catch (e) {
      // Handle the error as needed
      throw e;
    }
  }

  // 이미지 최종 저장
  Future saveImage(dynamic imageFile) async {
    print(imageFile.runtimeType);
    print(imageFile.path);
    try {
      final formData = FormData.fromMap({
        "userId": 1,
        "file": await MultipartFile.fromFile(imageFile.path,
            filename: 'free_image.jpg'),
      });
      print(formData);
      final response = await dio.post(Paths.recommendThree, data: formData);
      print(response);
      print(response.runtimeType);
      final dinosaursJson = response.data;
      print(dinosaursJson);
      print(dinosaursJson['dinosaurId']);
      final sendImageResponse = SendImageResponse.fromJson(dinosaursJson);
      print(sendImageResponse.runtimeType);
      // print("하잉 ${sendDrawingResponse.recommendation1}");
      return sendImageResponse;
    } catch (e) {
      // Handle the error as needed
      throw e;
    }
  }
}
