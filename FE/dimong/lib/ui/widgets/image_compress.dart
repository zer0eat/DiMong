import 'dart:io';
import 'package:flutter_image_compress/flutter_image_compress.dart';

Future<File?> compressImage(File imageFile) async {
  final result = await FlutterImageCompress.compressAndGetFile(
    imageFile.absolute.path,
    imageFile.parent.absolute.path,
    format: CompressFormat.jpeg,
    quality: 80,
  );
  // File object로 변환하여 return
  return result != null ? File(result.path) : null;
}