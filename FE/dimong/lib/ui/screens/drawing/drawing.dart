import 'package:flutter/material.dart';
import 'draw_dino_slider.dart';
import 'draw_free_page.dart';

class DrawingDino extends StatelessWidget {
  const DrawingDino({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 내 맘대로 그리기
              Container(
                margin: const EdgeInsets.only(
                  left: 30,
                  top: 50,
                ),
                child: const Text(
                  '내 맘대로 그리기',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Color(0xff6B6B6B),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),

              // 내 맘대로 그리기 설명
              Container(
                margin: const EdgeInsets.only(
                  top: 30,
                  left: 30,
                ),
                child: Text(
                  '내가 그리고 싶었던 것들을 \n마음껏 그려보세요',
                ),
              ),

              // 그리러가기 버튼
              Container(
                margin: const EdgeInsets.only(
                  top: 30,
                  left: 30,
                ),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      primary: const Color(0xff6B6B6B),
                      padding: const EdgeInsets.symmetric(
                        vertical: 14,
                        horizontal: 30,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DrawFreePage(),
                          ));
                    },
                    child: Text('그리러가기')),
              ),

              SizedBox(
                height: 70,
              ),

              // 주제 맞춰 그리기
              Container(
                margin: const EdgeInsets.only(
                  left: 30,
                  top: 50,
                ),
                child: const Text(
                  '주제 맞춰 그리기',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Color(0xff6B6B6B),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),

              Container(
                child: DinoDrawCard(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
