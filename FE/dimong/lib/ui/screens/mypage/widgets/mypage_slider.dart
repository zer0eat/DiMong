import 'package:carousel_slider/carousel_slider.dart';
import 'package:dimong/ui/screens/mypage/mypage.dart';
import 'package:flutter/material.dart';
import 'package:dimong/ui/widgets/connect_route.dart';

class MypageCard extends StatefulWidget {
  final List<dynamic> dinos;
  const MypageCard({Key? key, required this.dinos});

  @override
  _MypageCardState createState() => _MypageCardState();
}

class _MypageCardState extends State<MypageCard> {
  late CarouselController _controller;
  int _current = 0;
  Text rankEmoji(int? index) {
    if (index == 0) {
      return const Text(
        '🥇',
        style: TextStyle(
          fontSize: 35.0,
        ),
      );
    } else if (index == 1) {
      return const Text(
        '🥈',
        style: TextStyle(
          fontSize: 35.0,
        ),
      );
    } else if (index == 2) {
      return const Text(
        '🥉',
        style: TextStyle(
          fontSize: 35.0,
        ),
      );
    } else {
      return const Text('순위없음');
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = CarouselController();
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic>? drawingInfo = widget.dinos;
     print("card 출력: $drawingInfo");
    // print("card[0]: ${drawingInfo![0]}");
    // print("속 값: ${drawingInfo![0].runtimeType}");
    ConnectRoute _connectRoute = ConnectRoute();
    if(!drawingInfo.isEmpty)
      {
        List<dynamic> idList = [
          drawingInfo![0]['dinosaurId'],
          drawingInfo![1]['dinosaurId'],
          drawingInfo![2]['dinosaurId'],
        ];
      }
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        CarouselSlider.builder(
          itemCount: 3,
          itemBuilder: (context, index, realIndex) {
            return Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    bottom: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(16.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 5.0,
                        spreadRadius: 0.0,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: GestureDetector(
                    onTap: () {
                      if (drawingInfo != [] && drawingInfo![index]['dinosaurId'] >= 0) {
                        _connectRoute.toDinoDetail(
                            context, drawingInfo[index]['dinosaurId']);
                      }
                    },
                    child: Center(
                      child: Stack(
                        children: [
                          Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Image.asset(
                                    drawingInfo.isEmpty
                                        ? 'assets/images/captureAgain.png'
                                        : 'assets/images/dino/${drawingInfo![index]['dinosaurName']}.png',
                                    //: 'assets/images/dino/티라노사우루스.png',
                                    height: 130,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  drawingInfo.isEmpty ?
                                      '비슷한 공룡을 찾지 못했어요': '비슷한 공룡을 찾았어요',
                                  style: TextStyle(
                                    color: Color(0xFFACC864),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  ),
                                ),
                              ]),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(top: 10, child: rankEmoji(index)),
              ],
            );
          },
          options: CarouselOptions(
            height: 200,
            viewportFraction: 0.7,
            disableCenter: true,
            // aspectRatio: 2.0,
            enlargeCenterPage: true,
            enableInfiniteScroll: true,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 5),
            autoPlayCurve: Curves.fastOutSlowIn,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
          carouselController: _controller,
        ),
      ],
    );
  }
}
