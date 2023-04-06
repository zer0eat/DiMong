import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

File? _image; //File? = declare the variable, File object or nullable
final picker = ImagePicker();

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

// 비동기 처리를 통해 카메라와 갤러리에서 이미지를 가져온다.
// Future은 async / await 작업을 위한 선언의 한종류
Future<File?> getImageFile(ImageSource imageSource) async {
  final image = await picker.pickImage(source: imageSource);
  if(image == null) return null;
  return File(image!.path);
}
