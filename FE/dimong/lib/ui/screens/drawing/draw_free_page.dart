import 'package:flutter/material.dart';

import 'dino_canvas.dart';

class DrawFreePage extends StatelessWidget {
  const DrawFreePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 뒤로가기 버튼
        leading: const BackButton(
          color: Color(0xFFACC864),
        ),
        actions: [
          // 제출 버튼
          TextButton(
            onPressed: () {
              // canvas.save()
            },
            child: const Text(
              '저장',
              style: TextStyle(
                  fontSize: 17,
                  color: Color(0xFFACC864),
                  fontWeight: FontWeight.w600),
            ),
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Stack(children: [
        DinoCanvas(),
      ]),
    );
  }
}
