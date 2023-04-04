import 'data.dart';
import 'package:dimong/core/domain/dino.dart';

class MyPageRepository {
  final MyPageApiClient myPageApiClient = MyPageApiClient();

   Future<SendProfileResponse> sendMyList(int? id) async {
     return await myPageApiClient.sendMyList(id);
   }

  Future<List<SendBadgeResponse>> sendBadge(int? dinosaurId) async {
    return await myPageApiClient.sendBadge(dinosaurId);
  }
}