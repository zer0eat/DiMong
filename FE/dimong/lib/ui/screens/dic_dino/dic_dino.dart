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
    return const Stack(
      children: [
        DinoGrid(),
        FabMenu(),
      ],
    );
  }
}