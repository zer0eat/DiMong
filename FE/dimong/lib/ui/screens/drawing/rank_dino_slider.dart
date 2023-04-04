import 'package:dimong/ui/widgets/connect_route.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'rank_dino.dart';

class RankDinoCard extends StatefulWidget {
  const RankDinoCard({super.key, required this.dinos});
  final Map<String, dynamic> dinos;

  // final List<Map<String, dynamic>> dinoList = dinos.entries.map((entry) {
  //   final key = entry.key;
  //   final value = entry.value;
  //   return {
  //     'recommendation': key,
  //     'dinosaurId': value != null ? value['dinosaurId'] : null,
  //     'dinosaurName': value != null ? value['dinosaurName'] : null,
  //   };
  // }).toList();
  @override
  _RankDinoCardState createState() => _RankDinoCardState();
}

class _RankDinoCardState extends State<RankDinoCard> {
  int _currentIndex = 0;
  late List<Map<String, dynamic>> dinoList;
  final CarouselController carouselController = CarouselController();
  Text _rankEmoji(String recoIndex) {
    if (recoIndex == 'recommendation1') {
      return const Text(
        '🥇',
        style: TextStyle(
          fontSize: 25.0,
        ),
      );
    } else if (recoIndex == 'recommendation2') {
      return const Text(
        '🥈',
        style: TextStyle(
          fontSize: 25.0,
        ),
      );
    } else if (recoIndex == 'recommendation3') {
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
    if (widget.dinos == null) {
      // 통신 통해서 값 가져오기
    } else {
      dinoList = widget.dinos.entries.map((entry) {
        final key = entry.key;
        final value = entry.value;
        return {
          'recommendation': key,
          'dinosaurId': value != null ? value['dinosaurId'] : null,
          'dinosaurName': value != null ? value['dinosaurName'] : null,
        };
      }).toList();
    }
  }

  // print(dinoList);
  Widget build(BuildContext context) {
    // Widget myImage;

    var nav = ConnectRoute();
    print("리스트화! $dinoList");
    return Column(children: [
      const SizedBox(
        height: 20,
      ),
      // CarouselSlider(items: items, options: options)
      CarouselSlider(
        items: dinoList.map((item) {
          print(item);
          // if (item["dinosaurName"] != null) {
          //   myImage = Image.asset(
          //     'assets/images/my_image.png',
          //     fit: BoxFit.cover,
          //   );
          // } else {
          //   myImage = Container(); // or any other widget that you want to display instead of the image
          // }
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
                    if (item["dinosaurId"] != null) {
                      nav.toDinoDetail(context, item["dinosaurId"]);
                    }
                  },
                  child: Center(
                    child: Container(
                      child: Stack(
                        children: [
                          Positioned(
                              top: 10,
                              child: _rankEmoji(item["recommendation"])),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Image.asset(
                                    item["dinosaurName"] == null
                                        ? 'assets/images/analyzing.png'
                                        : 'assets/images/dino/${item["dinosaurName"]}.png',
                                    height: 130,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  item["dinosaurName"] ?? '비슷한 공룡을 찾지 못했어요',
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
              );
            },
          );
        }).toList(),
        carouselController: carouselController,
        options: CarouselOptions(
          autoPlay: true,
          aspectRatio: 10 / 7,
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
