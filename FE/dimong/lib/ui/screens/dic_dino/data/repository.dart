import '../data/data.dart';
import 'package:dimong/core/domain/dino.dart';

class DictionaryRepository {
  final DictionaryApiClient dictionaryApiClient = DictionaryApiClient();

  Future<List<SendPeriodResponse>> sendPeriod(String? period) async {
    return await dictionaryApiClient.sendPeriod(period);
  }
}