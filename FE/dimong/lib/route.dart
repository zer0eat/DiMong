import 'package:flutter/material.dart';

class RoutePaths {
  // internal
  static const home = '/home'; // 로그인
  static const login = '/login'; // 로그인
  static const navBar = '/navbar/{index}'; // 로그인
  static const dinoDetail = '/dinosaurs/{dinosaurId}'; // 공룡상세
  static const dinoDictionary = '/dinosaurs'; // 공룡주소
  static const dinoAudio = '//dinosaurs/audio/{dinosaurId}'; // 공룡 설명하는 오디오
  static const myInfo = '/my_page/{userId}'; // 내정보
  static const drawingList = '/my_page/{userId}/drawings'; // 내 그림 목록
  static const myDrawingDetail = '/drawings/{drawingId}'; // 내 그림 상세
  static const drawingMain = '/drawing/main'; // 그림페이지메인
  static const themeDrawing = '/drawing/theme'; // 주제맞춰그리기
  static const freeDrawing = '/drawing/free'; // 자유롭게 그리기
  static const camera = '/camera'; // 카메라페이지
  static const gallery = '/pictures'; // 갤러리페이지

}