// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dino.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendPeriodResponse _$SendPeriodResponseFromJson(Map<String, dynamic> json) =>
    SendPeriodResponse(
      dinosaurId: json['dinosaurId'] as int?,
      dinosaurImageUrl: json['dinosaurImageUrl'] as String?,
      dinosaurName: json['dinosaurName'] as String?,
      dinosaurTaste: json['dinosaurTaste'] as String?,
      collected: json['collected'] as bool?,
    );

Map<String, dynamic> _$SendPeriodResponseToJson(SendPeriodResponse instance) =>
    <String, dynamic>{
      'dinosaurId': instance.dinosaurId,
      'dinosaurImageUrl': instance.dinosaurImageUrl,
      'dinosaurName': instance.dinosaurName,
      'dinosaurTaste': instance.dinosaurTaste,
      'collected': instance.collected,
    };

SendInfoResponse _$SendInfoResponseFromJson(Map<String, dynamic> json) =>
    SendInfoResponse(
      dinosaurId: json['dinosaurId'] as int,
      dinosaurImageUrl: json['dinosaurImageUrl'] as String,
      dinosaurAudioUrl: json['dinosaurAudioUrl'] as String,
      dinosaurName: json['dinosaurName'] as String,
      dinosaurHabitat: json['dinosaurHabitat'] as String,
      dinosaurTaste: json['dinosaurTaste'] as String,
      geologicAge: json['geologicAge'] as String,
      dinosaurWeight: json['dinosaurWeight'] as String,
      dinosaurLength: json['dinosaurLength'] as String,
      dinosaurNickname: json['dinosaurNickname'] as String,
      dinosaurIntellect: json['dinosaurIntellect'] as int,
      dinosaurAggression: json['dinosaurAggression'] as int,
      dinosaurCharacteristic: json['dinosaurCharacteristic'] as String,
    );

Map<String, dynamic> _$SendInfoResponseToJson(SendInfoResponse instance) =>
    <String, dynamic>{
      'dinosaurId': instance.dinosaurId,
      'dinosaurImageUrl': instance.dinosaurImageUrl,
      'dinosaurAudioUrl': instance.dinosaurAudioUrl,
      'dinosaurName': instance.dinosaurName,
      'dinosaurHabitat': instance.dinosaurHabitat,
      'dinosaurTaste': instance.dinosaurTaste,
      'dinosaurCharacteristic': instance.dinosaurCharacteristic,
      'geologicAge': instance.geologicAge,
      'dinosaurWeight': instance.dinosaurWeight,
      'dinosaurLength': instance.dinosaurLength,
      'dinosaurIntellect': instance.dinosaurIntellect,
      'dinosaurAggression': instance.dinosaurAggression,
      'dinosaurNickname': instance.dinosaurNickname,
    };

SendImageResponse _$SendImageResponseFromJson(Map<String, dynamic> json) =>
    SendImageResponse(
      dinosaurId: json['dinosaurId'] as int?,
      dinosaurName: json['dinosaurName'] as String?,
      dinosaurImageUrl: json['dinosaurImageUrl'] as String?,
      found: json['found'] as bool?,
    );

Map<String, dynamic> _$SendImageResponseToJson(SendImageResponse instance) =>
    <String, dynamic>{
      'dinosaurId': instance.dinosaurId,
      'dinosaurName': instance.dinosaurName,
      'dinosaurImageUrl': instance.dinosaurImageUrl,
      'found': instance.found,
    };

SendDrawingResponse _$SendDrawingResponseFromJson(Map<String, dynamic> json) =>
    SendDrawingResponse(
      recommendation1: json['recommendation1'],
      recommendation2: json['recommendation2'],
      recommendation3: json['recommendation3'],
    );

Map<String, dynamic> _$SendDrawingResponseToJson(
        SendDrawingResponse instance) =>
    <String, dynamic>{
      'recommendation1': instance.recommendation1,
      'recommendation2': instance.recommendation2,
      'recommendation3': instance.recommendation3,
    };

SendLoginResponse _$SendLoginResponseFromJson(Map<String, dynamic> json) =>
    SendLoginResponse(
      email: json['email'] as String,
      fullName: json['fullName'] as String,
      profileImageUrl: json['profileImageUrl'] as String?,
    );

Map<String, dynamic> _$SendLoginResponseToJson(SendLoginResponse instance) =>
    <String, dynamic>{
      'email': instance.email,
      'fullName': instance.fullName,
      'profileImageUrl': instance.profileImageUrl,
    };

SendBadgeResponse _$SendBadgeResponseFromJson(Map<String, dynamic> json) =>
    SendBadgeResponse(
      badgeId: json['badgeId'] as int?,
      badgeName: json['badgeName'] as String?,
      badgeImageUrl: json['badgeImageUrl'] as String?,
      collected: json['collected'] as bool,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$SendBadgeResponseToJson(SendBadgeResponse instance) =>
    <String, dynamic>{
      'badgeId': instance.badgeId,
      'badgeName': instance.badgeName,
      'badgeImageUrl': instance.badgeImageUrl,
      'collected': instance.collected,
      'createdAt': instance.createdAt,
    };

SendProfileResponse _$SendProfileResponseFromJson(Map<String, dynamic> json) =>
    SendProfileResponse(
      userId: json['userId'] as int?,
      userNickname: json['userNickname'] as String?,
      userProfileImage: json['userProfileImage'] as String?,
      myDrawingList: json['myDrawingList'],
    );

Map<String, dynamic> _$SendProfileResponseToJson(
        SendProfileResponse instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'userNickname': instance.userNickname,
      'userProfileImage': instance.userProfileImage,
      'myDrawingList': instance.myDrawingList,
    };

DrawingDetailResponse _$DrawingDetailResponseFromJson(
        Map<String, dynamic> json) =>
    DrawingDetailResponse(
      drawingId: json['drawingId'] as int?,
      drawingImageUrl: json['drawingImageUrl'] as String?,
      userId: json['userId'] as int?,
      userNickname: json['userNickname'] as String?,
      similarList: json['similarList'] as List<dynamic>?,
    );

Map<String, dynamic> _$DrawingDetailResponseToJson(
        DrawingDetailResponse instance) =>
    <String, dynamic>{
      'drawingId': instance.drawingId,
      'drawingImageUrl': instance.drawingImageUrl,
      'userId': instance.userId,
      'userNickname': instance.userNickname,
      'similarList': instance.similarList,
    };

SendProfileRequest _$SendProfileRequestFromJson(Map<String, dynamic> json) =>
    SendProfileRequest(
      providerId: json['providerId'] as String?,
      userNickname: json['userNickname'] as String?,
      userEmail: json['userEmail'] as String?,
      userProfileImage: json['userProfileImage'] as String?,
    );

Map<String, dynamic> _$SendProfileRequestToJson(SendProfileRequest instance) =>
    <String, dynamic>{
      'providerId': instance.providerId,
      'userNickname': instance.userNickname,
      'userEmail': instance.userEmail,
      'userProfileImage': instance.userProfileImage,
    };

SendIdResponse _$SendIdResponseFromJson(Map<String, dynamic> json) =>
    SendIdResponse(
      userId: json['userId'] as int?,
      accessToken: json['accessToken'] as String?,
    );

Map<String, dynamic> _$SendIdResponseToJson(SendIdResponse instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'accessToken': instance.accessToken,
    };

AllDrawingResponse _$AllDrawingResponseFromJson(Map<String, dynamic> json) =>
    AllDrawingResponse(
      drawingId: json['drawingId'] as int?,
      myDrawingUrl: json['myDrawingUrl'] as String?,
    );

Map<String, dynamic> _$AllDrawingResponseToJson(AllDrawingResponse instance) =>
    <String, dynamic>{
      'drawingId': instance.drawingId,
      'myDrawingUrl': instance.myDrawingUrl,
    };
