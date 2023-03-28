// annotation: 주석처럼 코드를 작성하여 특별한 의미를 부여하는 것
import 'package:json_annotation/json_annotation.dart';
import '../api/api.dart';

part 'dino.g.dart';

@JsonSerializable()
class SendPeriodResponse {
  @JsonKey(name: 'dinosaurId')
  final int? dinosaurId;
  @JsonKey(name: 'dinosaurUrl')
  final String? dinosaurUrl;
  @JsonKey(name: 'dinosaurName')
  final String? dinosaurName;

  SendPeriodResponse({this.dinosaurId, this.dinosaurUrl, this.dinosaurName});

  factory SendPeriodResponse.fromJson(Map<String, dynamic> json) =>
      _$SendPeriodResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SendPeriodResponseToJson(this);
}

@JsonSerializable()
class SendInfoResponse {
  final int dinosaurId;
  final String dinosaurName;
  final String long;
  final String weight;
  final String when;
  final String where;
  final String nickname;
  final String eat;
  final String characteristic;

  SendInfoResponse(
      {
        required this.dinosaurId,
        required this.dinosaurName,
        required this.long,
        required this.weight,
        required this.when,
        required this.where,
        required this.nickname,
        required this.eat,
        required this.characteristic,
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
