import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dimong/ui/widgets/connect_route.dart';


class HomeSliderCard extends StatefulWidget {
  const HomeSliderCard({super.key});

  @override
  _HomeSliderCardState createState() => _HomeSliderCardState();
}

class _HomeSliderCardState extends State<HomeSliderCard> {
  int _currentIndex = 0;
  //  별명, 이름, 공룡 이미지
  final List DinoList = [
    {
      "id": 1,
      "name": "공룡백과",
      "image_path": "assets/images/dic_dino.png",
      "go" : "Go!",

},
    {
      "id": 2,
      "name": "그림그리기",
      "image_path": "assets/images/painting.png",
      "go" : "Go!",

    },
    {
      "id": 3,
      "name": "미술관",
      "image_path": "assets/images/gallery.png",
      "go" : "Go!",
    },
    {
      "id": 4,
      "name": "내정보",
      "image_path": "assets/images/myinfo.png",
      "go" : "Go!",
    },
  ];

  final CarouselController carouselController = CarouselController();
  // int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    ConnectRoute connectRoute = ConnectRoute();
    return Column(children: [
      const SizedBox(
        height: 20,
      ),
      CarouselSlider(
        items: DinoList.map((item) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                decoration: BoxDecoration(
                  color: Color(0xFFE4EECB),
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
                  onTap: () async {
                    await connectRoute.toNavBar(context, item["id"]);
                  },
                  child: Center(
                    child: Stack(
                      children: [
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                item["image_path"],
                                height: 90,
                                width: 90,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                item["name"],
                                style: TextStyle(
                                  color: Color(0xFF476930),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),
                              Text(
                                item["go"],
                                style: TextStyle(
                                  color: Color(0xFF444444),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
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
          autoPlay: true,
          aspectRatio: 3 / 2,
          viewportFraction: 0.4,
          enlargeCenterPage: true,
          onPageChanged: (index, reason) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
      const SizedBox(
        height: 50,
      )
    ]);
  }
}

