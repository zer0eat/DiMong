/*
import 'dart:io';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../domain/dino.dart';
import 'package:retrofit/retrofit.dart';
import '../auth/token_interceptor.dart';
import '../auth/auth_provider.dart';
import '../local_storage/secure_storage.dart';
import '../utils/api_routes.dart';

Future<String?> getIdToken(AuthProvider authProvider) async {
  final idToken = await SecureStorage().getIdToken();
  return idToken;
}

@RestApi()
abstract class RestClient{
  factory RestClient (Dio dio, AuthProvider authProvider) {
    final idToken = getIdToken(authProvider);
    dio.options.headers[HttpHeaders.authorizationHeader]= 'Bearer $idToken';
    // token intereptor spring 요청 기준으로 작성
    final tokenInterceptor =
    TokenInterceptor(dio: dio, authProvider: authProvider, secureStorage: SecureStorage());
    dio.interceptors.add(tokenInterceptor);
    dio.interceptors.add(InterceptorsWrapper(
      onError: (DioError error, handler) {
        if (error.response?.statusCode == 401) {
          authProvider.logout();
        }
        return handler.next(error);
      },
    ));
    return _RestClient(dio);
  }
  //Future <Server로부터 return 받고 싶은 값>
  // 시대별 공룡 목록
  @GET(Paths.dinoList)
  Future<SendPeriodResponse> getDinosaurs(@Path('period') String period);
  */
/*
  @GET(Paths.etcList)
  Future<Response> getOrganisms(@Path('kind') String kind);
  @GET(Paths.dinoDetail)
  Future<Response> getDinosaurDetail(@Path('dinosaurId') int dinosaurId);
  @GET(Paths.etcDetail)
  Future<Response> getOrganismDetail(@Path('organismId') int organismId);
  @GET(Paths.dinoAudio)
  Future<Response> getDinosaurAudio(@Path('dinosaurId') int dinosaurId);
  @GET(Paths.myInfo)
  Future<Response> getMyInfo(@Path('userId') int userId);
  @GET(Paths.drawingList)
  Future<Response> getDrawingList(@Path('userId') int userId);
  @GET(Paths.myDrawingDetail)
  Future<Response> getMyDrawingDetail(@Path('drawingId') int drawingId);
  @GET(Paths.drawingGuide)
  Future<Response> getDrawingGuide();
  @POST(Paths.recommendThree)
  Future<Response> getRecommendThree();
  @GET(Paths.themeList)
  Future<Response> getThemeList();
  @GET(Paths.drawingDetail)
  Future<Response> getDrawingDetail(@Path('dinosaurId') int dinosaurId);
  @POST(Paths.badgeCheck)
  Future<Response> getBadgeCheck();*//*

  @POST(Paths.cameraDino)
  @MultiPart()
  Future<SendImageResponse> postCameraDino(@Part(name: 'image')  String json);
  @POST('/auth/refresh_token')
  Future<SendInfoResponse> refreshToken(@Body() Map<String, dynamic> refreshToken);
}

*/
