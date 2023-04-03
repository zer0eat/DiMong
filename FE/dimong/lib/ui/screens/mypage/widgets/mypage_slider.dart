import 'package:carousel_slider/carousel_slider.dart';
import 'package:dimong/ui/screens/mypage/mypage.dart';
import 'package:flutter/material.dart';
import 'package:dimong/ui/widgets/connect_route.dart';

class MypageCard extends StatefulWidget {
  final Map<String, dynamic> dinos;
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
          fontSize: 25.0,
        ),
      );
    } else if (index == 1) {
      return const Text(
        '🥈',
        style: TextStyle(
          fontSize: 25.0,
        ),
      );
    } else if (index == 2) {
      return const Text(
        '🥉',
        style: TextStyle(
          fontSize: 25.0,
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
    Map<String, dynamic> drawingInfo = widget.dinos;
    List similarSlider = [drawingInfo['similarDinosaurId1'], drawingInfo['similarDinosaurId2'], drawingInfo['similarDinosaurId3'],];
    ConnectRoute _connectRoute = ConnectRoute();
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: similarSlider.length,
          itemBuilder: (context, index, realIndex) {
            final int itemId = similarSlider[index];
            return InkWell(
              onTap: () {
                if(similarSlider[index]!=null){
                  _connectRoute.toDinoDetail(context, similarSlider[index]);
                }
              },
              child: Container(
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
                    if (similarSlider[index]!=null) {
                      _connectRoute.toDinoDetail(context, similarSlider[index]);
                    }
                  },
                  child: Center(
                    child: Container(
                      child: Stack(
                        children: [
                          Positioned(
                              top: 10,
                              child: rankEmoji(index)),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Image.asset(
                                    similarSlider[index] == null
                                        ? 'assets/images/analyzing.png'
                                        //: 'assets/images/dino/${similarSlider[index]}.png',
                                        : 'assets/images/dino/티라노사우루스.png',
                                    height: 130,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  similarSlider[index] ?? '비슷한 공룡을 찾지 못했어요',
                                  style: TextStyle(
                                    color: Color(0xFFACC864),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ]),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
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
