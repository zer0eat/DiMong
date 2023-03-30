import '../data/data.dart';
import 'package:dimong/core/domain/dino.dart';

class DinoDetailRepository {
  final DetailApiClient detailApiClient = DetailApiClient();

  Future<SendInfoResponse> sendId(int? dinosaurId) async {
    return await detailApiClient.sendId(dinosaurId);
  }
}