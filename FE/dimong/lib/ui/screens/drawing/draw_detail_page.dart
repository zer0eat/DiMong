import 'dart:convert';

import 'package:dimong/ui/screens/drawing/rank_dino_slider.dart';
import 'package:flutter/material.dart';

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
    print(imageData);
    print(imageData.runtimeType);
    String jsonString = jsonEncode(RankData);
    Map<String, dynamic> response = jsonDecode(jsonString) ?? {};
    print('넘어왔낭');
    print(response);
    return Scaffold(
      appBar: AppBar(
        // 뒤로가기 버튼
        leading: const BackButton(
          color: Color(0xFFACC864),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Column(children: [
        Text("이 공룡들과 비슷해요!"),
        RankDinoCard(dinos: response),
        SizedBox(
          height: 30,
        ),
        Container(height: 300, child: Image.memory(imageData)),
      ]),
    );
  }
}
