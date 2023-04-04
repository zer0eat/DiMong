import 'package:flutter/material.dart';
import 'draw_free_page.dart';

class DrawingDino extends StatelessWidget {
  const DrawingDino({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/draw_bg2.png"),
              opacity: 0.7,
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(

                  'assets/images/analyzing.png',
                  width: 140,
                  height: 140,
                ),
                // 내 맘대로 그리기
                Container(
                  child: const Text(
                    '공룡 뱃지 모으기',
                    style: TextStyle(
                      color: Color(0xff444444),
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                ),

                // 내 맘대로 그리기 설명
                Container(
                  margin: const EdgeInsets.only(
                    top: 10,
                  ),
                  child: const Text(
                    '도감 공룡들을 그려 \n뱃지를 모아보세요!',
                    style: TextStyle(
                      color: Color(0xff444444),
                      // fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFFACC864),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5.0,
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: Icon(Icons.question_mark_rounded,
                      color: Colors.white,),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: Colors.transparent,
                            content: Image.asset('assets/images/draw_guide.png'),
                          );
                        },
                      );
                    },
                  ),
                ),
                // 그리러가기 버튼
                Container(
                  margin: const EdgeInsets.only(
                    top: 80,
                    bottom: 130,
                  ),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        primary: const Color(0xff48642B),
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
                      child: const Text('Draw Now!',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),)),
                ),



                // 주제 맞춰 그리기
                // Container(
                //   margin: const EdgeInsets.only(
                //     left: 30,
                //     top: 50,
                //   ),
                //   child: const Text(
                //     '주제 맞춰 그리기',
                //     textAlign: TextAlign.start,
                //     style: TextStyle(
                //       color: Color(0xff6B6B6B),
                //       fontWeight: FontWeight.bold,
                //       fontSize: 18,
                //     ),
                //   ),
                // ),
                //
                // Container(
                //   child: DinoDrawCard(),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
