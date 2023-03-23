// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dino.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DinosaurInfo _$DinosaurInfoFromJson(Map<String, dynamic> json) => DinosaurInfo(
      info: Dino.fromJson(json['info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DinosaurInfoToJson(DinosaurInfo instance) =>
    <String, dynamic>{
      'info': instance.info,
    };

DinosaurFind _$DinosaurFindFromJson(Map<String, dynamic> json) => DinosaurFind(
      id: (json['id'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$DinosaurFindToJson(DinosaurFind instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

Dino _$DinoFromJson(Map<String, dynamic> json) => Dino(
      id: json['id'] as int,
      name: json['name'] as String,
      long: json['long'] as String,
      weight: json['weight'] as String,
      when: json['when'] as String,
      where: json['where'] as String,
      nickname: json['nickname'] as String,
      eat: json['eat'] as String,
      characteristic: json['characteristic'] as String,
    );

Map<String, dynamic> _$DinoToJson(Dino instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'long': instance.long,
      'weight': instance.weight,
      'when': instance.when,
      'where': instance.where,
      'nickname': instance.nickname,
      'eat': instance.eat,
      'characteristic': instance.characteristic,
    };
