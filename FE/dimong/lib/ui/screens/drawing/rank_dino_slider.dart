import 'package:dimong/ui/screens/home/connect_home.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
                    child: Stack(
                      children: [
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/dino/${item["dinosaurName"]}.png',
                                errorBuilder: (BuildContext context,
                                    Object exception, StackTrace? stackTrace) {
                                  return Image.asset(
                                    'assets/images/analyzing.png',
                                  );
                                },
                                height: 150,
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
