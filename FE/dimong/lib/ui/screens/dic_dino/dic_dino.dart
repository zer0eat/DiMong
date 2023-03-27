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
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: Container(
              color: Colors.transparent,
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: TabBar(
                tabs: [
                  Tab(text: '쥐라기'),
                  Tab(text: '백악기'),
                ],
                indicatorColor: const Color(0xFF476930),
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: const Color(0xFF476930),
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
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
