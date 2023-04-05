import 'package:dimong/core/api/api.dart';
import 'package:dimong/core/domain/dino.dart';
import 'package:dimong/core/utils/api_routes.dart';
import 'package:dimong/core/local_storage/secure_storage.dart';

class MyPageApiClient {
  final dio = DataServerDio.instance();
  SecureStorage _secureStorage = SecureStorage();

  Future<dynamic> sendMyList() async {
    try {
      final userId = await _secureStorage.getUserId();
      final response = await dio.get(Paths.myInfo + '$userId',
      data:{
        "userId": userId
      });
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
  Future<List<SendBadgeResponse>> sendBadge() async {
    try {
      final userId = await _secureStorage.getUserId();
      print("id: $userId");
      final response = await dio.get(Paths.badgeList+'$userId',
          data: {
            "userId": userId
          }
      );
      print("when response in data: $response");
      print("status: ${response.statusCode}");
      print(response.runtimeType);
      final dinosaursJson =  response.data as List<dynamic>;
      print(dinosaursJson);
      final sendBadgeResponse= dinosaursJson.map((dinosaursJson) => SendBadgeResponse.fromJson(dinosaursJson)).toList();
      print("sendInfoResponse: $sendBadgeResponse");
      print(sendBadgeResponse.runtimeType);
      return sendBadgeResponse;
    } catch (e) {
      // Handle the error as needed
      throw e;
    }
  }
}