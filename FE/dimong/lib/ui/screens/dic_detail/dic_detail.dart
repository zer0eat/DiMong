import 'package:flutter/material.dart';
import 'package:dimong/core/domain/dino.dart';
import 'package:provider/provider.dart';
import './logic/usecase.dart';

class DinoDetail extends StatefulWidget {
  final int id;
  const DinoDetail({Key? key, required this.id}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DinoDetailState();
}

class _DinoDetailState extends State<DinoDetail> {
  final DinoDetailUseCase _useCase = DinoDetailUseCase();

  @override
  void initState(){
    super.initState();
    _useCase.loadInfo(widget.id);
  }

  Widget _detailFeature(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 13.0,
            color: Color(0xFF7C7C7C),
          ),
        ),
        const SizedBox(height: 5.0),
        Text(
          value,
          style: const TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF476930),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SendInfoResponse>(
      stream: _useCase.dataStream,
      builder: (context, snapshot) {
        if(snapshot.hasData && _useCase.isLoading == false){
          final data =snapshot.data;

          print("rendering: $data");
          print(data.runtimeType);
          String? name;
          return Scaffold(
              appBar: AppBar(
                // 뒤로가기 버튼
                // leading: const BackButton(
                //   color: Color(0xFFFFFFFF),
                // ),
                // 뒤로가기 버튼
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back_rounded),
                  color: const Color(0xFFFFFFFF),
                  iconSize: 30.0, // 아이콘 크기를 지정함
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                backgroundColor: Colors.transparent,
                elevation: 0.0,
              ),
              extendBodyBehindAppBar: true,
              body: Center(
                // child:
                // Text(id.toString()),
                // ),
                child: Stack(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFFACC864),Color(0xFFD1EAD7)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),

                    // 하얀색 정보 상자 부분
                    Positioned(
                      top: 235.0,
                      left: 16.0,
                      right: 16.0,
                      bottom: 16.0,
                      child: SingleChildScrollView(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [

                              // 공룡 이름
                              Container(
                                padding: EdgeInsets.only(top:80.0,bottom: 10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                     Text(
                                      data!.dinosaurName,
                                      // '${data!.dinosaurName!}',
                                      style: TextStyle(
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF476930),
                                      ),
                                    ),
                                    Container(
                                        padding: EdgeInsets.all(6.0),
                                        margin: EdgeInsets.only(left:5.0),
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black38,
                                              blurRadius: 10.0,
                                            ),
                                          ],
                                        ),
                                        child:
                                        Text('🌿',
                                          style: TextStyle(
                                            fontSize: 17.0,
                                          ),)
                                    ),
                                  ],
                                ),
                              ),

                              // tts 재생 아이콘
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 40.0,
                                    height: 40.0,
                                    margin: EdgeInsets.only(right:10.0),
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xFFACC864),
                                    ),
                                    child: IconButton(
                                      icon: const Icon(
                                        Icons.volume_up_rounded,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        //${data!.dinosaurAudioUrl}
                                      },
                                    ),
                                  ),
                                  Text('Dino Id : ${widget.id}'),
                                  // Text(id.toString()),
                                ],
                              ),

                              // 공룡 정보
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    //_detailFeature('길이', '7.9m'),
                                    //_detailFeature('무게', '6000kg'),
                                    //_detailFeature('서식지', '북아메리카'),
                                    _detailFeature('길이', '${data!.dinosaurLength}'),
                                    _detailFeature('무게', '${data!.dinosaurWeight}'),
                                    _detailFeature('서식지', '${data!.dinosaurHabitat}'),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    _detailFeature('식성', '${data!.dinosaurTaste}'),
                                    _detailFeature('별명', '${data!.dinosaurNickname}'),
                                    _detailFeature('지질시대', '${data!.geologicAge}'),
                                  ],
                                ),
                              ),

                              // 지능, 공격성 정보
                              Padding(
                                padding: EdgeInsets.all(15.0),
                                child: Column(
                                  children: [
                                    LinearProgressIndicator(
                                      value: 0.75,
                                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                                      backgroundColor: Colors.grey[300],
                                    ),
                                    SizedBox(height: 8.0),
                                    LinearProgressIndicator(
                                      value: 0.25,
                                      valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                                      backgroundColor: Colors.grey[300],
                                    ),
                                  ],
                                ),
                              ),

                              // 공룡 특징
                               Padding(
                                padding:  EdgeInsets.symmetric(
                                  vertical: 8.0,
                                  horizontal: 20.0,),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        data.dinosaurCharacteristic!,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF476930),
                                          height: 1.8,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),

                    // Circular
                    Positioned(
                      top: 100.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        height: 200.0,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [Color(0x1AFFFFFF),Color(0x99D2DCC4)],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 100.0,
                      left: 80.0,
                      child: Container(
                        width: 200.0,
                        height: 200.0,
                        child: Image.asset(
                          'assets/images/dino/${data.dinosaurName}.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              )
          );
        }
        else{
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      }
    );
  }
}

