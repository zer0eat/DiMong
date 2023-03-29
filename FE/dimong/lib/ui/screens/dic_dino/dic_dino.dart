import 'package:flutter/material.dart';
import 'package:dimong/ui/screens/dic_dino/widgets/fab_menu.dart';
import 'package:dimong/ui/screens/dic_dino/widgets/dino_grid.dart';

class DicDino extends StatefulWidget {
  const DicDino({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DicDinoState();
}

class _DicDinoState extends State<DicDino> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(200.0),
            child: Container(
              color: Colors.transparent,
              padding: const EdgeInsets.symmetric(
                  vertical: 10.0,),
              child: const TabBar(
                tabs: [
                  Tab(text: '쥬 라 기'),
                  Tab(text: '백 악 기'),
                ],
                indicatorColor: Color(0xFF476930),
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: Color(0xFF476930),
                labelStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
              ),
            ),
          ),
          body: const Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 10.0),
            child: TabBarView(
              children: [
                Stack(
                  children: [
                    DinoGrid(),
                    FabMenu(),
                  ],
                ),
                Stack(
                  children: [
                    DinoGrid(),
                    FabMenu(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
