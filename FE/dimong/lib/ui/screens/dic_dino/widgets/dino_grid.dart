import 'package:flutter/material.dart';
import 'package:shaky_animated_listview/animators/grid_animator.dart';
import 'package:shaky_animated_listview/animators/shake_transition.dart';
import 'package:shaky_animated_listview/scroll_animator.dart';
import 'package:shaky_animated_listview/widgets/animated_gridview.dart';
import 'package:shaky_animated_listview/widgets/animated_listview.dart';

class DinoGrid extends StatefulWidget {
  const DinoGrid({Key? key}) : super(key: key);

  @override
  State<DinoGrid> createState() => _DinoGridState();
}

class _DinoGridState extends State<DinoGrid> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(10, (index)=> GridAnimatorWidget(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: Container(
              color: const Color(0xFFACC864),
              child: Text(
                'Item $index',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ),
        ),
      ),).toList()
        );
  }
}
