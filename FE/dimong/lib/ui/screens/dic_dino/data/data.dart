import 'package:dimong/core/api/api.dart';
import 'package:dimong/core/domain/dino.dart';
import 'package:dimong/core/utils/api_routes.dart';
import 'package:dimong/core/local_storage/secure_storage.dart';

class DictionaryApiClient {
  final dio = DataServerDio.instance();
  SecureStorage _secureStorage = SecureStorage();

  Future<dynamic> sendPeriod() async {
    try {
      final userId = await _secureStorage.getUserId();
      Map<String, dynamic> queryParam = {"userId": userId};

      final response = await dio.get(Paths.dinoList, queryParameters: queryParam);
      print("data.dart: response = $response");
      print(response.runtimeType);
      print("data.dart: response.data = ${response.data}");

      final dinosaursJson =  response.data as List<dynamic>;
      print(dinosaursJson);

      final sendPeriodResponse = dinosaursJson
          .map((dinosaursJson) => SendPeriodResponse.fromJson(dinosaursJson))
          .toList();
      return sendPeriodResponse;
    } catch (e) {
      // Handle the error as needed
      throw e;
    }
  }
}