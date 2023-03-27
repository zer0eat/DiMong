import 'package:flutter/material.dart';

import 'dino_canvas.dart';

class DrawDinoPage extends StatelessWidget {
  const DrawDinoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 뒤로가기 버튼
        leading: const BackButton(
          color: Color(0xFFACC864),
        ),
        actions: [
          // 공룡 설명버튼 ('?' 아이콘)
          IconButton(
            icon: Icon(
              Icons.question_mark_rounded,
              color: Colors.grey,
            ),
            onPressed: () => showDialog(
              context: context,
              builder: (BuildContext context) {
                // 공룡 설명 버튼 모달 -> 위젯으로 만들어서 수정하기!
                return AlertDialog(
                  title: Text('이름'),
                  content: Text("내용"),
                  actions: [
                    TextButton(
                      child: Text("닫기"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            ),
          ),
          // 제출 버튼
          TextButton(
            onPressed: () {
              // canvas.save()
            },
            child: const Text(
              '제출',
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
