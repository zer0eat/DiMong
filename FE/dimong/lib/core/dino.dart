// annotation: 주석처럼 코드를 작성하여 특별한 의미를 부여하는 것
import 'package:json_annotation/json_annotation.dart';
part 'dino.g.dart';

// Serialization: 통신, 저장과 재구축이 가능한 포맷으로 object를 변환하는 과정을 말한다.
// Serialization의 예: json으로 변환 / deserialization의 예: dart object로 변환
// dart:convert를 이용한 수동 Json 직렬화를 사용하지 않은 이유
// 이상한 데이터를 받았을 때 오류가 나서, 앱 사용에 지장을 주는 경우를 방지하기 위해
// 공룡의 정보로 다양한 값의 데이터를 받아오기 때문에 관리하기 쉽고, 비교적 간결한 @JsonSerializable 사용
@JsonSerializable()
class DinosaurInfo {
  Dino info;
  DinosaurInfo({required this.info});

  // factory: class instance를 return해주는 constructor
  // Map: dart에서 사용하는 key-value collection type으로 key: String, value dynamic으로 선언
  // dynamic: json data는 다양한 타입의 데이터를 가질 수 있는데,(원하지 않던 데이터일 경우도 있다)
  // 이에 대응하기 위해 컴파일할 때 타입 검사를 하지 않는 dynamic을 사용한다.
  factory DinosaurInfo.fromJson(Map<String, dynamic> receiveData) => _$DinosaurInfoFromJson(receiveData);

  Map<String, dynamic> toJson() => _$DinosaurInfoToJson(this);
}

@JsonSerializable()
class DinosaurFind{
  final List<String> id;

  DinosaurFind({required this.id});

  factory DinosaurFind.fromJson(Map<String, dynamic> receiveData){
    var nameData = receiveData['result'] as List;
    List<String> dinoId = nameData.map((i) => i['id'] as String).toList();
    return DinosaurFind(id: dinoId);
  }
}

@JsonSerializable()
class Dino {
  //@JsonKey(id: 'id')
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

  factory Dino.fromJson(Map<String, dynamic> receiveData) => _$DinoFromJson(receiveData);

  Map<String, dynamic> toJson() => _$DinoToJson(this);
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