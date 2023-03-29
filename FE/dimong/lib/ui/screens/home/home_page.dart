import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        padding: EdgeInsets.only(top:50.0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFffffff),Color(0x33ACC864)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              Center(
              // child: RotationTransition(
              // turns: _animation,
                child: Image.asset(
                  'assets/images/loading.gif',
                  width: 200,
                  height: 200,
                ),
              ),
            // ),
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                '안녕하세요\n디몽 앱에 오신 것을 환영합니다!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/analyzing.png',
                    width: 150,
                    height: 150,
                  ),
                  Image.asset(
                    'assets/images/dimong.png',
                    width: 150,
                    height: 150,
                  ),
                ],
              ),
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                '사진 찍어 공룡 찾아 도감도 완성하고\n그림도 그려 뱃지를 모아보세요.',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                CurrencyCard(
                name: '공룡백과',
                icon: Icons.menu_book_rounded,
                isInverted: false,
                dino: 'assets/images/dic_dino.png',
              ),
              SizedBox(height: 16),
              CurrencyCard(
                  name: '공룡그리기',
                  icon: Icons.palette_rounded,
                  isInverted: true,
                  dino: 'assets/images/painting.png'),
              SizedBox(height: 16),
              CurrencyCard(
                  name: '내정보',
                  icon: Icons.person_rounded,
                  isInverted: false,
                  dino: 'assets/images/dic_etc.png'),
                ]),
               )],
              ),
            ),
          ),
        ),
      ),
    );
  }
}