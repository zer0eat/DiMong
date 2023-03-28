// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dino.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendPeriodResponse _$SendPeriodResponseFromJson(Map<String, dynamic> json) =>
    SendPeriodResponse(
      dinosaurId: json['dinosaurId'] as int?,
      dinosaurUrl: json['dinosaurUrl'] as String?,
      dinosaurName: json['dinosaurName'] as String?,
    );

Map<String, dynamic> _$SendPeriodResponseToJson(SendPeriodResponse instance) =>
    <String, dynamic>{
      'dinosaurId': instance.dinosaurId,
      'dinosaurUrl': instance.dinosaurUrl,
      'dinosaurName': instance.dinosaurName,
    };

SendInfoResponse _$SendInfoResponseFromJson(Map<String, dynamic> json) =>
    SendInfoResponse(
      dinosaurId: json['dinosaurId'] as int,
      dinosaurName: json['dinosaurName'] as String,
      long: json['long'] as String,
      weight: json['weight'] as String,
      when: json['when'] as String,
      where: json['where'] as String,
      nickname: json['nickname'] as String,
      eat: json['eat'] as String,
      characteristic: json['characteristic'] as String,
    );

Map<String, dynamic> _$SendInfoResponseToJson(SendInfoResponse instance) =>
    <String, dynamic>{
      'dinosaurId': instance.dinosaurId,
      'dinosaurName': instance.dinosaurName,
      'long': instance.long,
      'weight': instance.weight,
      'when': instance.when,
      'where': instance.where,
      'nickname': instance.nickname,
      'eat': instance.eat,
      'characteristic': instance.characteristic,
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
