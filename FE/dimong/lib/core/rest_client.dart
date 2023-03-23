import 'package:dio/dio.dart';
import 'dino.dart';
import 'package:retrofit/retrofit.dart';
import 'dart:io';
import 'auth_dio.dart';
part 'rest_client.g.dart';

@RestApi(
    baseUrl: 'api server',
    // 데이터를 파싱하는 작업을 메인 쓰레드가 아닌, 백그라운드에서 작업을 수행하게 한다.
    // Dart는 비동기를 지원하는 싱글 스레드 환경으로, 복잡한 로직을 단순 실행 시, 버벅이는 모습을 볼 수 있다.
    // 이를 해결하기 위해, 별도의 메모리, 하나의 스레드, 이벤트 루프를 가진 isolate를 활용 할 수 있다.
    // 아래 코드는 메인 isolate가 아닌 백그라운드의 isolate에서 parsing 작업을 진행하여, app 구동에 장애를 방지한다.
    parser: Parser.FlutterCompute,
)
abstract class RestClient{
  factory RestClient (Dio dio, {String baseUrl}) = _RestClient;
  //Future <Server로부터 return 받고 싶은 값>

  // 그림그릴때 랭킹, 사진 찍을때 공룡찾기
  @GET("/findDino")
  Future<List<int>> getId();

  // 상세정보 불러오기
  //@GET("/data/{id}")
  //Future<Dino> getInfoById(@Path("id") String id);

  // 이미지 보내기1 파일
  @POST("/image")
  Future <Response> sendImage(File imageFile);

  // 이미지 보내기2 Map
  @PATCH("/image")
  Future <Response> sendToImage(@Body() Map<String, dynamic> map);
  
}

