import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:dimong/route.dart';
import 'card.dart';
import 'home_slider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
        fontFamily: 'KCCDodamdodam',),
      home: Center(
        child: Container(
          padding: EdgeInsets.only(top:50.0),
          color: Colors.white,
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
                    width: 150,
                    height: 150,
                  ),
                ),
              // ),

              const Center(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    '사진 찍어 공룡 찾아 도감도 완성하고\n그림도 그려 뱃지를 모아보세요.',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
                HomeSliderCard(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/analyzing.png',
                      width: 100,
                      height: 100,
                    ),
                    Image.asset(
                      'assets/images/dimong.png',
                      width: 100,
                      height: 100,
                    ),
                  ],
                ),
              ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}