import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'dino_canvas.dart';
import 'draw_dino_page.dart';

class RankDinoCard extends StatefulWidget {
  const RankDinoCard({super.key});

  @override
  _RankDinoCardState createState() => _RankDinoCardState();
}

class _RankDinoCardState extends State<RankDinoCard> {
  int _currentIndex = 0;
  //  별명, 이름, 공룡 이미지
  final List DinoList = [
    {
      "id": 1,
      "subText": "공룡의 왕",
      "name": "티라노사우루스",
      "image_path": "assets/images/dino/티라노사우루스.png"
    },
    {
      "id": 2,
      "subText": "3개의 뿔을 가진",
      "name": "트리케라톱스",
      "image_path": "assets/images/dino/트리케라톱스.png"
    },
    {
      "id": 3,
      "subText": "세상에서 제일 큰",
      "name": "아르헨티노사우루스",
      "image_path": "assets/images/dino/아르헨티노사우루스.png"
    },
  ];

  final CarouselController carouselController = CarouselController();
  // int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(
        height: 20,
      ),
      Text('이 공룡들과 비슷해요!'),
      CarouselSlider(
        items: DinoList.map((item) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
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
                // 터치액션
                child: GestureDetector(
                  onTap: () {
                    // 디테일 페이지로 이동하기!
                  },
                  child: Center(
                    child: Stack(
                      children: [
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                item["image_path"],
                                height: 150,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                item["name"],
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
              );
            },
          );
        }).toList(),
        carouselController: carouselController,
        options: CarouselOptions(
          autoPlay: false,
          aspectRatio: 10 / 8,
          viewportFraction: 0.7,
          enlargeCenterPage: true,
          onPageChanged: (index, reason) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    ]);
  }
}
