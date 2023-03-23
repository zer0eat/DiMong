//import 'package:http/http.dart' as http;

// dio 사용: Simpler API, Faster, Better error handling
import 'package:dio/dio.dart';
import 'dart:convert';
import 'dino.dart';
import 'dart:io';

class DioService{
  Future<void> networkManger(File imageFile) async {
    BaseOptions options = BaseOptions(
      baseUrl: '',
      connectTimeout: Duration(seconds: 3000),
      receiveTimeout: Duration(seconds: 3000),
      sendTimeout: Duration(seconds: 3000),
    );
    Dio dio = Dio(options);
    try{
      // 파일을 바이트로 변환하여 보내는 방법 -> 서버에서 다시 변환하는 작업 필요
      //List<int> imageBytes = await imageFile.readAsBytes();
      // FormData formData = FormData.fromMap({
      //   'image': MultipartFile.fromBytes(imageBytes, filename: 'cameraImage.jpg')
      // });
      //파일 자체를 보내는 방법
      FormData formData =FormData();
      formData.files.add(MapEntry('image', await MultipartFile.fromFile(imageFile!.path)));

      Response res = await dio.post(
        '/php',
        data: formData,
      );
      print('Response:');
      print('Status: ${res.statusCode}');
      print('Header:\n${res.headers}');
      print('Data:\n${res.data}');

      List <Dino> dinos = res.data.map<Dino>((dinoId){
        return Dino.fromJson(dinoId);
      }).toList();
      for (Dino dino in dinos){
        print(dino.id);
      }
    } catch(e){
      print('Exception: $e');
    }
  }
}


