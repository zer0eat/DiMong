import 'package:flutter/material.dart';
import 'card.dart';
import 'package:dimong/route.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                ),
                CurrencyCard(
                  name: '공룡백과',
                  subText: '공룡에 대해 알아볼까요?',
                  icon: Icons.book_rounded,
                  isInverted: false,
                  xDirection: true,
                  dino: 'assets/images/dic_dino.png',
                  route: RoutePaths.navBar,
                  argument: 1,
                ),
                CurrencyCard(
                    name: '생물백과',
                    subText: '같은 시대에 살았던 동식물은 뭐가 있을까요?',
                    icon: Icons.energy_savings_leaf_rounded,
                    isInverted: true,
                    xDirection: false,
                    dino: 'assets/images/dic_etc.png',
                    route: RoutePaths.navBar,
                    argument: 2,
                ),

                SizedBox(
                  width: 30,
                ),
                CurrencyCard(
                    name: '공룡그리기',
                    subText: '그림을 그리러 떠나볼까요?',
                    icon: Icons.palette_rounded,
                    isInverted: false,
                    xDirection: true,
                    dino: 'assets/images/painting.png',
                    route: RoutePaths.navBar,
                    argument: 3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
