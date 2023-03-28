import '../data/data.dart';
import 'dart:io';
import 'package:dimong/core/domain/dino.dart';

class CameraRepository {
  final CameraApiClient cameraApiClient =CameraApiClient();

  Future<SendImageResponse> sendImage(File? imageFile) async {
    return await cameraApiClient.sendImage(imageFile);
  }
}