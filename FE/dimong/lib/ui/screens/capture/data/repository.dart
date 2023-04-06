import '../data/data.dart';
import 'dart:io';
import 'package:dimong/core/domain/dino.dart';

class CameraRepository {
  final CameraApiClient cameraApiClient =CameraApiClient();
  Future<SendImageResponse> sendImage(File? imageFile) async {
    print("repository passed");
    return await cameraApiClient.sendImage(imageFile);
  }
}