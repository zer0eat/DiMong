import 'package:flutter/material.dart';

class RoutePaths {
  // internal
  static const login = '/login'; // 로그인
  static const dinoDetail = '/dinosaurs/{dinosaurId}'; // 공룡상세
  static const dinoDictionary = '/dinosaurs'; // 공룡주소
  static const String dinoAudio = '//dinosaurs/audio/{dinosaurId}'; // 공룡 설명하는 오디오
  static const String myInfo = '/my_page/{userId}'; // 내정보
  static const String drawingList = '/my_page/{userId}/drawings'; // 내 그림 목록
  static const String myDrawingDetail = '/drawings/{drawingId}'; // 내 그림 상세
  static const String drawingMain = '/drawing/main'; // 그림페이지메인
  static const String themeDrawing = '/drawing/theme'; // 주제맞춰그리기
  static const String freeDrawing = '/drawing/free'; // 자유롭게 그리기
  static const String camera = '/camera'; // 카메라페이지
  static const String gallery = '/pictures'; // 갤러리페이지

}