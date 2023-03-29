import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './logic/view.dart';

class DinoDetail extends StatelessWidget {
  final int id;
  const DinoDetail({Key? key, required this.id}) : super(key: key);

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
                          padding: EdgeInsets.only(top:80.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                '트리케라톱스',
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
                                child: Text('🌿',
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
                            IconButton(
                              icon: Icon(Icons.volume_up),
                              onPressed: () {},
                            ),
                            Text(id.toString()),
                          ],
                        ),

                        // 공룡 정보
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _detailFeature('길이', '7.9m'),
                              _detailFeature('무게', '6000kg'),
                              _detailFeature('서식지', '북아메리카'),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _detailFeature('식성', '초식'),
                              _detailFeature('별명', '세 뿔 얼굴'),
                              _detailFeature('지질시대', '백악기'),
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
                        const Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 20.0,),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: Text(
                                  '3개의 뿔, 앵무새 같은 부리, 그리고 목을 보호할 수 있는 프릴을 가지고 있습니다. 뿔은 포식자로부터 정면으로 방어하기 위한 수단으로 사용되었습니다, 실제로 티라노사우루스의 이빨 자국에 의한 상처 치유 흔적이 있는 뿔 화석이 1997년 수집된 적이 있습니다. 티라노사우루스와 만났지만, 뿔로 방어하고 살아남았으리라 추측해볼 수 있습니다. 뿔은 또한 트리케라톱스 수컷이 서로 경쟁을 하는데 있어서도 사용되었습니다.',
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
                      colors: [Color(0x99ACC864),Color(0x99D1EAD7)],
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
                    'assets/images/dino/트리케라톱스.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
                ),
               )
            );
            }
          }

