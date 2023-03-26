// annotation: 주석처럼 코드를 작성하여 특별한 의미를 부여하는 것
import 'package:json_annotation/json_annotation.dart';
import '../api/rest_client.dart';
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
  @JsonKey(name: 'body')
  final int? dinosaurId;
  final String? dinosaurName;

  SendImageResponse({this.dinosaurId, this.dinosaurName});

  factory SendImageResponse.fromJson(Map<String, dynamic> json) =>
      _$SendImageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SendImageResponseToJson(this);
}


// @JsonSerializable() 사용 x
/*
class DinosaurInfo {
  final List<Dino> info;
  // required: 비우면 안될때, 임의적으로 채워줄 때 사용한다.
  // this: 현재 instance this.result: 새로 생성된 instance의 result;(위에서 선언)
  DinosaurInfo({required this.info});

  // factory: class instance를 return해주는 constructor
  // Map: dart에서 사용하는 key-value collection type으로 key: String, value dynamic으로 선언
  // dynamic: json data는 다양한 타입의 데이터를 가질 수 있는데,(원하지 않던 데이터일 경우도 있다)
  // 이에 대응하기 위해 컴파일할 때 타입 검사를 하지 않는 dynamic을 사용한다.
  factory DinosaurInfo.fromJson(Map<String, dynamic> receiveData) {
    // List 자료형으로 뽑자
    var imageData = receiveData['result'] as List;
    //list: json data -> userslist: dart object data 변환 과정
    List<Dino> dinoInfo = imageData.map((i) => Dino.fromJson(i)).toList();

    return DinosaurInfo(
      info: dinoInfo,
    );
  }
}

class DinosaurName{
  final List<String> name;

  DinosaurName({required this. name});

  factory DinosaurName.fromJson(Map<String, dynamic> receiveData){
    var nameData = receiveData['result'] as List;
    List<String> dinoName = nameData.map((i) => i['name'] as String).toList();
    return DinosaurName(name: dinoName,);
  }
}

class Dino {
  final int id;
  final String name;
  final String long;
  final String weight;
  final String when;
  final String where;
  final String nickname;
  final String eat;
  final String characteristic;

  Dino(
      {
        required this.id,
        required this.name,
        required this.long,
        required this.weight,
        required this.when,
        required this.where,
        required this.nickname,
        required this.eat,
        required this.characteristic,
      });

  factory Dino.fromJson(Map<String, dynamic> receiveData) {
    return Dino(
      id : receiveData['id'],
      name: receiveData['name'],
      long: receiveData['long'],
      weight: receiveData['weight'],
      when: receiveData['when'],
      where: receiveData['where'],
      nickname: receiveData['nickname'],
      eat: receiveData['eat'],
      characteristic: receiveData['characteristic'],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "long": long,
    "weight": weight,
    "when": when,
    "where": where,
    "nickname": nickname,
    "eat": eat,
    "characteristic": characteristic,
  };
}
*/