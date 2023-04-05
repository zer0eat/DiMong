import 'package:dimong/core/api/api.dart';
import 'package:dimong/core/domain/dino.dart';
import 'package:dimong/core/utils/api_routes.dart';
import 'package:dimong/core/local_storage/secure_storage.dart';

class GalleryApiClient {
  final dio = DataServerDio.instance();
  SecureStorage _secureStorage = SecureStorage();
  Future<dynamic> sendList() async {
    try {
      //String dinosaurEra = period!;
      //print("period: $period");
      final userId = await _secureStorage.getUserId();
      final response = await dio.get(Paths.myInfo+'$userId',
      data:{
        "userId": userId,
      }
      );
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
}