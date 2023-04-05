import 'package:dimong/core/api/api.dart';
import 'package:dimong/core/domain/dino.dart';
import 'package:dimong/core/utils/api_routes.dart';
import 'package:dimong/core/local_storage/secure_storage.dart';

class GalleryApiClient {
  final dio = DataServerDio.instance();
  SecureStorage _secureStorage = SecureStorage();
  Future<List<AllDrawingResponse>> sendList() async {
    try {
      final userId = await _secureStorage.getUserId();
      final response = await dio.get(Paths.allDrawing);
      print("data.dart: response = $response");
      print(response.runtimeType);
      print("data.dart: response.data = ${response.data}");
      final dinosaursJson =  response.data as List<dynamic>;
      print("dinosaursJson type: ${dinosaursJson.runtimeType}");
      final sendPeriodResponse = dinosaursJson.map((dinosaursJson) => AllDrawingResponse.fromJson(dinosaursJson)).toList();
      print("sendPeriodResponse: ${sendPeriodResponse.runtimeType}");
      return sendPeriodResponse;
    } catch (e) {
      // Handle the error as needed
      throw e;
    }
  }
}