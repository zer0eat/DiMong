import 'package:flutter/material.dart';

import 'dino_canvas.dart';

class DrawDinoPage extends StatelessWidget {
  final String name;
  static const List<Map<String, dynamic>> DinoList = [
    {
      "name": "티라노사우루스",
      "description":
          "티라노사우루스의 특징은?\n\n몸집에 비해 팔이 매우 짧아요!\n무시무시한 이빨과 강력한 턱이 있어요!\n두 발로 서 있어요!",
    },
    {
      "name": "트리케라톱스",
      "description": "트리케라톱스에 대한 설명입니다.",
    },
    {
      "name": "아르헨티노사우루스",
      "description": "아르헨티노사우루스에 대한 설명입니다.",
    },
  ];
  const DrawDinoPage({required this.name, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dinoInfo =
        DinoList.firstWhere((dino) => dino['name'] == name, orElse: () => {});
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
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          name,
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.cancel_rounded,
                            color: Colors.grey,
                            size: 30,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ]),
                  content: Text(dinoInfo['description'] ?? ''),
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
