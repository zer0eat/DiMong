import 'data.dart';
import 'package:dimong/core/domain/dino.dart';

class GalleryRepository {
  final GalleryApiClient galleryApiClient = GalleryApiClient();

   Future<List<AllDrawingResponse>> sendList() async {
     return await galleryApiClient.sendList();
   }

}