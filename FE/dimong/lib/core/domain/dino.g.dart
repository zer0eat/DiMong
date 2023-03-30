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
    );

Map<String, dynamic> _$SendPeriodResponseToJson(SendPeriodResponse instance) =>
    <String, dynamic>{
      'dinosaurId': instance.dinosaurId,
      'dinosaurImageUrl': instance.dinosaurImageUrl,
      'dinosaurName': instance.dinosaurName,
    };

SendInfoResponse _$SendInfoResponseFromJson(Map<String, dynamic> json) =>
    SendInfoResponse(
      dinosaurId: json['dinosaurId'] as int,
      dinosaurImageUrl: json['dinosaurImageUrl'] as String,
      dinosaurAudioUrl: json['dinosaurAudioUrl'] as String,
      dinosaurName: json['dinosaurName'] as String,
      dinosaurHabitat: json['dinosaurHabitat'] as String,
      dinosaurTaste: json['dinosaurTaste'] as String,
      dinosaurCharacteristic: json['dinosaurCharacteristic'] as String,
      geologicAge: json['geologicAge'] as String,
      dinosaurHeight: json['dinosaurHeight'] as String,
      dinosaurWeight: json['dinosaurWeight'] as String,
      dinosaurLength: json['dinosaurLength'] as String,
      intellect: json['intellect'] as String,
      aggression: json['aggression'] as String,
      nickname: json['nickname'] as String,
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
      'dinosaurHeight': instance.dinosaurHeight,
      'dinosaurWeight': instance.dinosaurWeight,
      'dinosaurLength': instance.dinosaurLength,
      'intellect': instance.intellect,
      'aggression': instance.aggression,
      'nickname': instance.nickname,
    };

SendImageResponse _$SendImageResponseFromJson(Map<String, dynamic> json) =>
    SendImageResponse(
      dinosaurId: json['dinosaurId'] as int?,
      dinosaurName: json['dinosaurName'] as String?,
    );

Map<String, dynamic> _$SendImageResponseToJson(SendImageResponse instance) =>
    <String, dynamic>{
      'dinosaurId': instance.dinosaurId,
      'dinosaurName': instance.dinosaurName,
    };
