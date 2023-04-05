import 'dart:convert';
import 'package:flutter/material.dart';
import '../mypage/widgets/mypage_slider.dart';

class GalleryImagePage extends StatelessWidget {
  final List<dynamic> drawInfo;
  final String imageData;
  const GalleryImagePage({Key? key, required this.drawInfo, required this.imageData})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
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
        MypageCard(dinos: drawInfo),
        SizedBox(
          height: 30,
        ),
        Container(height: 300, child: Image.network(imageData)),
      ]),
    );
  }
}