import 'dart:convert';

import 'package:dimong/ui/screens/drawing/rank_dino_slider.dart';
import 'package:flutter/material.dart';

import '../../widgets/connect_route.dart';

class DrawDetailPage extends StatelessWidget {
  final RankData;
  final imageData;
  const DrawDetailPage({Key? key, this.RankData, this.imageData})
      : super(key: key);

  // Future<Map<String, dynamic>> _fetchRankData() async {
  //   final response = await http.get()
  // }
  @override
  Widget build(BuildContext context) {
    var nav = ConnectRoute();
    print(
        '내가 그린 그림 디테일페이지 \n이건 이미지 데이터##$imageData##,\n이건 순위 데이터##$RankData###');
    // print(imageData);
    // print(imageData.runtimeType);
    String jsonString = jsonEncode(RankData);
    Map<String, dynamic> response = jsonDecode(jsonString) ?? {};
    print('그림 디테일 페이지 넘어왔낭');
    print(response);
    return Scaffold(
      appBar: AppBar(
        // 뒤로가기 버튼
        actions: [
          IconButton(
            icon: Icon(
              Icons.home_rounded,
              size: 35,
              color: Color(0xFFACC864),
            ),
            onPressed: () => {nav.toNavBar(context, 2)},
          ),
        ],
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Column(children: [
        Text(
          "이 공룡들과 비슷해요!",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        RankDinoCard(dinos: response),
        SizedBox(
          height: 30,
        ),
        SizedBox(
          height: 300,
          child: Stack(
            children: [
              Container(child: Image.memory(imageData)),
              if (response["recommendation1"]["dinosaurName"] != null)
                Positioned(
                  right: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('획득!'),
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(90),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ), // changes position of shado]),
                        child: Image.asset(
                          'assets/badges/${response["recommendation1"]["dinosaurName"]}.png',
                          height: 38,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ]),
    );
  }
}
