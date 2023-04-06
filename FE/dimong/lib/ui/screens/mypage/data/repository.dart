import 'data.dart';
import 'package:dimong/core/domain/dino.dart';

class MyPageRepository {
  final MyPageApiClient myPageApiClient = MyPageApiClient();

   Future<SendProfileResponse> sendMyList() async {
     return await myPageApiClient.sendMyList();
   }

  Future<DrawingDetailResponse> sendDrawing(int? drawingId) async {
    return await myPageApiClient.sendDrawing(drawingId);
  }

  Future<List<SendBadgeResponse>> sendBadge() async {
    return await myPageApiClient.sendBadge();
  }
}