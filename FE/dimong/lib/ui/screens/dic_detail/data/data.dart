import 'package:dimong/core/api/api.dart';
import 'package:dimong/core/domain/dino.dart';
import 'package:dimong/core/utils/api_routes.dart';
import 'package:dimong/core/local_storage/secure_storage.dart';

class DetailApiClient {
  final dio = DataServerDio.instance();
  SecureStorage _secureStorage = SecureStorage();
  Future<SendInfoResponse> sendId(int? id) async {
    try {
      print("id: $id");
      final userId = await _secureStorage.getUserId();
      final response = await dio.get(Paths.dinoDetail+'$id',
      data: {
        "dinosaurId": id
      },queryParameters: {"userId": userId}
      );
      print("when response in data: $response");
      print("status: ${response.statusCode}");
      print(response.runtimeType);
      final dinosaursJson =  response.data;
      print(dinosaursJson);
      final sendInfoResponse = SendInfoResponse.fromJson(dinosaursJson);
      print("sendInfoResponse: $sendInfoResponse");
      print(sendInfoResponse.runtimeType);
      return sendInfoResponse;
    } catch (e) {
      // Handle the error as needed
      throw e;
    }
  }

  Future<Map<String, dynamic>> receiveAudio(int? id) async {
    try {
      print("id: $id");
      final response = await dio.get(Paths.gptAudio+'$id',
          data: {
            "dinosaurId": id
          }
      );
      print("when response in data: $response");
      print("status: ${response.statusCode}");
      print(response.runtimeType);
      final audioJson =  response.data;
      print(audioJson);
      // final sendInfoResponse = SendInfoResponse.fromJson(audioJson);
      // print("sendInfoResponse: $sendInfoResponse");
      // print(sendInfoResponse.runtimeType);
      return audioJson;
    } catch (e) {
      // Handle the error as needed
      throw e;
    }
  }
}