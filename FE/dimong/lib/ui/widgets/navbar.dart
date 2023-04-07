// 기본 디자인 widget 제공
import 'package:flutter/material.dart';
// 기능 import
import 'package:dimong/ui/screens/home/home_page.dart';
import 'package:dimong/ui/widgets/connect_route.dart';
import 'package:dimong/ui/screens/drawing/drawing.dart';
import 'package:dimong/ui/screens/dic_dino/dic_dino.dart';
import 'package:dimong/ui/screens/mypage/mypage.dart';
import 'package:dimong/route.dart';
import 'package:provider/provider.dart';
import 'package:dimong/core/auth/auth_provider.dart';

import 'package:motion_tab_bar_v2/motion-badge.widget.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
import 'package:motion_tab_bar_v2/motion-tab-item.dart';

import '../screens/gallery/gallery.dart';

// NavBar Widget을 생성
class NavBar extends StatefulWidget {
  final int index;
  const NavBar({Key? key, required this.index}) : super(key: key);

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
      initialIndex: widget.index,
      length: 5,
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
    final authProvider = Provider.of<AuthProvider>(context);
    const labels = ["Home", "Dino", "Draw", "Gallery", "MyPage"];
    final initIndex = widget.index;
    return MaterialApp(
      theme: ThemeData(
      fontFamily: 'KCCDodamdodam',),
      home: Scaffold(
        bottomNavigationBar: MotionTabBar(
          initialSelectedTab: labels[initIndex],
          useSafeArea: true, // default: true, apply safe area wrapper
          labels: labels,
          icons: const [
            Icons.home_rounded,
            Icons.menu_book_rounded,
            Icons.color_lens,
            Icons.grid_view_rounded,
            Icons.person,
          ],

          tabSize: 50,
          tabBarHeight: 55,
          textStyle: const TextStyle(
            fontSize: 14,
            color: const Color(0xFFACC864),
            fontWeight: FontWeight.w500,
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
            ConnectHome(),
            DicDino(),
            DrawingDino(),
            Gallery(),
            MyPage(),
          ],
        ),
      ),
    );
  }
}