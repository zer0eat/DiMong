// 기본 디자인 widget 제공
import 'package:flutter/material.dart';
// 기능 import
import 'package:dimong/ui/screens/home/home_page.dart';
import 'package:dimong/ui/screens/drawing/drawing.dart';
import 'package:dimong/ui/screens/dic_dino/dic_dino.dart';
import 'package:dimong/ui/screens/mypage/mypage.dart';

import 'package:motion_tab_bar_v2/motion-badge.widget.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
import 'package:motion_tab_bar_v2/motion-tab-item.dart';

// NavBar Widget을 생성
class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Motion Tab Bar Sample',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Motion Tab Bar Sample'),
    );
  }

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      length: 4,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MotionTabBar(
        initialSelectedTab: "홈",
        useSafeArea: true, // default: true, apply safe area wrapper
        labels: const ["홈", "공룡백과", "그림", "내정보"],
        icons: const [
          Icons.home_rounded,
          Icons.menu_book_rounded,
          Icons.color_lens,
          Icons.person,
        ],

        tabSize: 50,
        tabBarHeight: 55,
        textStyle: const TextStyle(
          fontSize: 13,
          color: const Color(0xFFACC864),
          fontWeight: FontWeight.bold,
        ),
        tabIconColor: const Color(0xFF6B6B6B),
        tabIconSize: 28.0,
        tabIconSelectedSize: 26.0,
        tabSelectedColor: const Color(0xFFACC864),
        tabIconSelectedColor: Colors.white,
        tabBarColor: const Color(0xFFFFFFFF),
        onTabItemSelected: (int value) {
          setState(() {
            _tabController!.index = value;
          });
        },
      ),
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: <Widget>[
          HomePage(),
          DicDino(),
          DrawingDino(),
          MyPage(),
        ],
      ),
    );
  }
}