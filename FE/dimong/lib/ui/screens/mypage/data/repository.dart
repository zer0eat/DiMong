import 'data.dart';
import 'package:dimong/core/domain/dino.dart';

class MyPageRepository {
  final MyPageApiClient myPageApiClient = MyPageApiClient();

  // Future<List<SendProfileResponse>> sendUserId() async {
  //   return await myPageApiClient.sendUserId();
  // }

  Future<List<SendBadgeResponse>> sendBadge(int? dinosaurId) async {
    return await myPageApiClient.sendBadge(dinosaurId);
  }
}