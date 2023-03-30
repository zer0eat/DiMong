// annotation: 주석처럼 코드를 작성하여 특별한 의미를 부여하는 것
import 'package:json_annotation/json_annotation.dart';
import '../api/api.dart';

part 'dino.g.dart';

@JsonSerializable()
class SendPeriodResponse {
  @JsonKey(name: 'dinosaurId')
  final int? dinosaurId;
  @JsonKey(name: 'dinosaurImageUrl')
  final String? dinosaurImageUrl;
  @JsonKey(name: 'dinosaurName')
  final String? dinosaurName;

  SendPeriodResponse({this.dinosaurId, this.dinosaurImageUrl, this.dinosaurName});

  factory SendPeriodResponse.fromJson(Map<String, dynamic> json) =>
      _$SendPeriodResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SendPeriodResponseToJson(this);
}

@JsonSerializable()
class SendInfoResponse {
  @JsonKey(name: 'dinosaurId')
  final int dinosaurId;
  @JsonKey(name: 'dinosaurImageUrl')
  final String dinosaurImageUrl;
  @JsonKey(name: 'dinosaurAudioUrl')
  final String dinosaurAudioUrl;
  @JsonKey(name: 'dinosaurName')
  final String dinosaurName;
  @JsonKey(name: 'dinosaurHabitat')
  final String dinosaurHabitat;
  @JsonKey(name: 'dinosaurTaste')
  final String dinosaurTaste;
  @JsonKey(name: 'dinosaurCharacteristic')
  final String dinosaurCharacteristic;
  @JsonKey(name: 'geologicAge')
  final String geologicAge;
  @JsonKey(name: 'dinosaurHeight')
  final String dinosaurHeight;
  @JsonKey(name: 'dinosaurWeight')
  final String dinosaurWeight;
  @JsonKey(name: 'dinosaurLength')
  final String dinosaurLength;
  @JsonKey(name: 'intellect')
  final String intellect;
  @JsonKey(name: 'aggression')
  final String aggression;
  @JsonKey(name: 'nickname')
  final String nickname;

  SendInfoResponse(
      {
        required this.dinosaurId,
        required this.dinosaurImageUrl,
        required this.dinosaurAudioUrl,
        required this.dinosaurName,
        required this.dinosaurHabitat,
        required this.dinosaurTaste,
        required this.dinosaurCharacteristic,
        required this.geologicAge,
        required this.dinosaurHeight,
        required this.dinosaurWeight,
        required this.dinosaurLength,
        required this.intellect,
        required this.aggression,
        required this.nickname,
      });

  factory SendInfoResponse.fromJson(Map<String, dynamic> receiveData) => _$SendInfoResponseFromJson(receiveData);

  Map<String, dynamic> toJson() => _$SendInfoResponseToJson(this);
}

@JsonSerializable()
class SendImageResponse {
  @JsonKey(name: 'dinosaurId')
  final int? dinosaurId;
  @JsonKey(name: 'dinosaurName')
  final String? dinosaurName;

  SendImageResponse({this.dinosaurId, this.dinosaurName});

  factory SendImageResponse.fromJson(Map<String, dynamic> json) =>
      _$SendImageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SendImageResponseToJson(this);
}
