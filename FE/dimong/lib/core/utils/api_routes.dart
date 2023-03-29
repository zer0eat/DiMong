import 'package:flutter/material.dart';

class Paths {
  // to server
  static const dinoList = '/api/v1/dinosaurs?period={period}'; // 공룡 주소
  static const etcList = '/api/v1/organisms?kind={kind}'; // 생물 주소
  static const dinoDetail = '/api/v1/dinosaurs/{dinosaurId}'; // 생물 주소
  static const etcDetail = '/api/v1/organisms{organismId}'; // 생물 상세
  static const dinoAudio = '/api/v1/dinosaurs/audio/{dinosaurId}'; // 공룡 설명하는 오디오
  static const myInfo = '/api/v1/mypage/{userId}'; // 내정보
  static const drawingList = '/api/v1/mypage/{userId}/drawings'; // 내 그림 목록
  static const myDrawingDetail = '/api/v1/drawings/{drawingId}'; // 내 그림 상세
  static const drawingGuide = '/api/v1/dinosaurs/random'; // 그려보기 가이드
  static const recommendThree= '/api/v1/drawings/free'; // 그려보기 3개 추천
  static const themeList = '/api/v1/dinosaurs'; // 주제맞춰그리기 리스트
  static const drawingDetail = '/api/v1/dinosaurs/{dinosaurId}/characteristic'; // 주제맞춰그리기 특징
  static const badgeCheck = '/api/v1/drawings/guide'; // 뱃지확인
  static const cameraDino = '/api/ai/v1/pictures/dinosaurs'; // 카메라
}