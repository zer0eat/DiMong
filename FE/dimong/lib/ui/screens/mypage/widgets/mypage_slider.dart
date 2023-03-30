import 'package:carousel_slider/carousel_slider.dart';
import 'package:dimong/ui/screens/mypage/mypage.dart';
import 'package:flutter/material.dart';

class MypageCard extends StatefulWidget {
  const MypageCard({Key? key});

  @override
  _MypageCardState createState() => _MypageCardState();
}

class _MypageCardState extends State<MypageCard> {
  final List<int> _items = List.generate(10, (index) => index);
  late CarouselController _controller;
  int _current = 0;

  @override
  void initState() {
    super.initState();
    _controller = CarouselController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: _items.length,
          itemBuilder: (context, index, realIndex) {
            final int itemId = _items[index];
            return InkWell(
              onTap: () {
                // Navigator.push(
                  // context,
                  // MaterialPageRoute(
                  //   builder: (_) => MyPagedraw(id: itemId),
                  // ),
                // );
              },
              child: Container(
                margin: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2.0,
                          blurRadius: 2.0)
                    ],
                    color: Colors.white),
                child: Center(
                  child: Text(
                    '그림 $itemId',
                    style: const TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,),
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
