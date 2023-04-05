import 'package:flutter/material.dart';

class Paths {
  // to server
  static const sendSignUp = '/api/auth/v1/signup/';
  static const sendLogin = '/api/auth/v1/login';
  static const dinoList = '/api/v4/dinosaurs'; // 공룡 주소
  static const dinoDetail = '/api/v2/dinosaurs/'; // 공룡 상세
  static const gptAudio = '/api/v1/dinosaurs/story/';
  static const myInfo = '/api/v1/mypage/'; // 내정보
  static const myDrawingDetail = '/api/v2/drawings/'; // 내 그림 상세
  static const allDrawing = '/api/v1/drawings'; // 내 그림 상세
  static const drawingGuide = '/api/v1/dinosaurs/random'; // 그려보기 가이드
  static const recommendThree = '/api/v1/drawings/dinosaurs'; // 그려보기 3개
  static const recommendThreeLive =
      '/api/v1/drawings/dinosaurs/live'; // 실시간 3개 추천
  static const themeList = '/api/v1/dinosaurs'; // 주제맞춰그리기 리스트
  static const drawingDetail =
      '/api/v1/dinosaurs/{dinosaurId}/characteristic'; // 주제맞춰그리기 특징
  static const badgeList = '/api/v1/badges/'; // 뱃지확인
  static const cameraDino = '/api/v1/pictures/dinosaurs'; // 카메라
}
