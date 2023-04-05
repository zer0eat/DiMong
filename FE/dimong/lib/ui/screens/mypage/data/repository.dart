import 'data.dart';
import 'package:dimong/core/domain/dino.dart';

class MyPageRepository {
  final MyPageApiClient myPageApiClient = MyPageApiClient();

   Future<SendProfileResponse> sendMyList() async {
     return await myPageApiClient.sendMyList();
   }

  Future<List<SendBadgeResponse>> sendBadge() async {
    return await myPageApiClient.sendBadge();
  }
}