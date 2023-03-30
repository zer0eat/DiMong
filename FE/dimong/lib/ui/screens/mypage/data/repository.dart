import 'data.dart';
import 'package:dimong/core/domain/dino.dart';

class MyPageRepository {
  final MyPageApiClient myPageApiClient = MyPageApiClient();

  Future<List<SendPeriodResponse>> sendUserId() async {
    return await myPageApiClient.sendUserId();
  }
}