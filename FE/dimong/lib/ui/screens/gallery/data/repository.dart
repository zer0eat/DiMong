import 'data.dart';
import 'package:dimong/core/domain/dino.dart';

class GalleryRepository {
  final GalleryApiClient galleryApiClient = GalleryApiClient();

   Future<SendProfileResponse> sendList() async {
     return await galleryApiClient.sendList();
   }

}