import 'package:dimong/core/api/api.dart';
import 'package:dimong/core/domain/dino.dart';
import 'package:dimong/core/utils/api_routes.dart';
import 'package:dimong/core/local_storage/secure_storage.dart';
class LoginApiClient {
  final dio = LoginServerDio.instance();
  SecureStorage _secureStorage = SecureStorage();

  Future<SendIdResponse> sendSignUp(SendProfileRequest _sendProfileRequest) async {
    try {
      print("request data: $_sendProfileRequest");
      print("request data type: $_sendProfileRequest");
      final response = await dio.post(Paths.sendSignUp+'google',
          data: {
            "providerId": _sendProfileRequest.providerId,
            "userNickname": _sendProfileRequest.userNickname,
            "userEmail": _sendProfileRequest.userEmail,
            "userProfileImage": _sendProfileRequest.userProfileImage,
          }
      );
      print("when response in data: $response");
      print("status: ${response.statusCode}");
      print(response.runtimeType);
      final dinosaursJson =  response.data;
      print(dinosaursJson);
      final sendIdResponse = SendIdResponse.fromJson(dinosaursJson);
      print("sendInfoResponse: $sendIdResponse");
      print(sendIdResponse.runtimeType);
      return sendIdResponse;
    } catch (e) {
      // Handle the error as needed
      print("login to Spring SignUp 오류");
      throw e;
    }
  }

  Future<SendIdResponse> sendLogin(SendProfileRequest _sendProfileRequest) async {
    try {
      print("request data: $_sendProfileRequest");
      print("request data type: $_sendProfileRequest");
      final response = await dio.post(Paths.sendLogin,
          data: {
          "providerType": "google",
            "providerId": _sendProfileRequest.providerId,
          }
      );
      print("when response in data: $response");
      print("status: ${response.statusCode}");
      print(response.runtimeType);
      final dinosaursJson =  response.data;
      print(dinosaursJson);
      final sendIdResponse = SendIdResponse.fromJson(dinosaursJson);
      print("sendInfoResponse: $sendIdResponse");
      print(sendIdResponse.runtimeType);
      return sendIdResponse;
    } catch (e) {
      // Handle the error as needed
      print("login to Spring Login 오류");
      throw e;
    }
  }
}