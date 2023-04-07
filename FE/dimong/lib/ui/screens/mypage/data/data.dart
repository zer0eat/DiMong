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

  Future<DrawingDetailResponse> sendDrawing(int? drawingId) async {
    try {
      //String dinosaurEra = period!;
      //print("period: $period");
      final userId = await _secureStorage.getUserId();
      final response = await dio.get(Paths.myDrawingDetail + '$drawingId',
          data:{
            "userId": userId,
            "drawingId": drawingId,
          });
      print("data.dart: response = $response");
      print(response.runtimeType);
      print("data.dart: response.data = ${response.data}");
      final dinosaursJson =  response.data;
      print(dinosaursJson);
      final drawingetailResponse = DrawingDetailResponse.fromJson(dinosaursJson);
      print(drawingetailResponse.runtimeType);
      return drawingetailResponse;
    } catch (e) {
      // Handle the error as needed
      throw e;
    }
  }
  Future<Map<String, dynamic>> deleteMyDrawing(int? drawingId) async {
    try {
      //String dinosaurEra = period!;
      //print("period: $period");
      final userId = await _secureStorage.getUserId();
      final response = await dio.delete(Paths.allDrawing + '/$drawingId',
          data:{
            "userId": userId,
            "drawingId": drawingId,
          });
      print("data.dart: response = $response");
      print(response.runtimeType);
      print("data.dart: response.data = ${response.data}");
      final dinosaursJson =  response.data;
      print(dinosaursJson);
      return dinosaursJson;
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