import 'package:dimong/ui/screens/drawing/rank_dino_slider.dart';
import 'package:flutter/material.dart';

class DrawDetailPage extends StatelessWidget {
  const DrawDetailPage({Key? key}) : super(key: key);

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
      body: Stack(children: [
        RankDinoCard(),
      ]),
    );
  }
}
