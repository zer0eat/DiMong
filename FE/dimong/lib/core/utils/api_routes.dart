import 'package:flutter/material.dart';

class Paths {
  // to server
  static const String dinoList = '/api/v1/dinosaurs?period={period}'; // 공룡 주소
  static const String etcList = '/api/v1/organisms?kind={kind}'; // 생물 주소
  static const String dinoDetail = '/api/v1/dinosaurs/{dinosaurId}'; // 생물 주소
  static const String etcDetail = '/api/v1/organisms{organismId}'; // 생물 상세
  static const String dinoAudio = '/api/v1/dinosaurs/audio/{dinosaurId}'; // 공룡 설명하는 오디오
  static const String myInfo = '/api/v1/mypage/{userId}'; // 내정보
  static const String drawingList = '/api/v1/mypage/{userId}/drawings'; // 내 그림 목록
  static const String myDrawingDetail = '/api/v1/drawings/{drawingId}'; // 내 그림 상세
  static const String drawingGuide = '/api/v1/dinosaurs/random'; // 그려보기 가이드
  static const String recommendThree= '/api/v1/drawings/free'; // 그려보기 3개 추천
  static const String themeList = '/api/v1/dinosaurs'; // 주제맞춰그리기 리스트
  static const String drawingDetail = '/api/v1/dinosaurs/{dinosaurId}/characteristic'; // 주제맞춰그리기 특징
  static const String badgeCheck = '/api/v1/drawings/guide'; // 뱃지확인
  static const String cameraDino = '/api/ai/b1/pictures/dinosaurs'; // 카메라

}