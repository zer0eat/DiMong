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
  @JsonKey(name: 'dinosaurTaste')
  final String? dinosaurTaste;

  SendPeriodResponse(
      {this.dinosaurId,
      this.dinosaurImageUrl,
      this.dinosaurName,
      this.dinosaurTaste});

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
  @JsonKey(name: 'dinosaurWeight')
  final String dinosaurWeight;
  @JsonKey(name: 'dinosaurLength')
  final String dinosaurLength;
  @JsonKey(name: 'dinosaurIntellect')
  final int dinosaurIntellect;
  @JsonKey(name: 'dinosaurAggression')
  final int dinosaurAggression;
  @JsonKey(name: 'dinosaurNickname')
  final String dinosaurNickname;

  SendInfoResponse({
    required this.dinosaurId,
    required this.dinosaurImageUrl,
    required this.dinosaurAudioUrl,
    required this.dinosaurName,
    required this.dinosaurHabitat,
    required this.dinosaurTaste,
    required this.geologicAge,
    required this.dinosaurWeight,
    required this.dinosaurLength,
    required this.dinosaurNickname,
    required this.dinosaurIntellect,
    required this.dinosaurAggression,
    required this.dinosaurCharacteristic,
  });

  factory SendInfoResponse.fromJson(Map<String, dynamic> receiveData) =>
      _$SendInfoResponseFromJson(receiveData);

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

@JsonSerializable()
class SendDrawingResponse {
  @JsonKey(name: 'recommendation1')
  final dynamic recommendation1;
  @JsonKey(name: 'recommendation2')
  final dynamic recommendation2;
  @JsonKey(name: 'recommendation3')
  final dynamic recommendation3;
  SendDrawingResponse(
      {this.recommendation1, this.recommendation2, this.recommendation3});

  factory SendDrawingResponse.fromJson(Map<String, dynamic> json) =>
      _$SendDrawingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SendDrawingResponseToJson(this);
}

@JsonSerializable()
class SendLoginResponse {
  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'fullName')
  final String fullName;
  @JsonKey(name: 'profileImageUrl')
  final String profileImageUrl;

  SendLoginResponse({required this.email, required this.fullName, required this.profileImageUrl});

  factory SendLoginResponse.fromJson(Map<String, dynamic> json) =>
      _$SendLoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SendLoginResponseToJson(this);
}