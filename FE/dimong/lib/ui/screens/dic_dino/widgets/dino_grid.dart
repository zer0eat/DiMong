import 'package:flutter/material.dart';
import 'package:shaky_animated_listview/animators/grid_animator.dart';
import 'package:shaky_animated_listview/animators/shake_transition.dart';
import 'package:shaky_animated_listview/scroll_animator.dart';
import 'package:shaky_animated_listview/widgets/animated_gridview.dart';
import 'package:shaky_animated_listview/widgets/animated_listview.dart';
import '../dic_detail.dart';

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
      children: List.generate(10,(id) => InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => DinoDetail(id: id),
              ),
            );
          },
          child: GridAnimatorWidget(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Container(
                  padding: const EdgeInsets.all(7),
                  color: const Color(0xFFACC864),
                  child: Stack(
                    children: [
                      Positioned(
                        child: ClipOval(
                          child: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: [Color(0x33FFFFFF),Color(0x99D2DCC4)],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                            width: 200,
                            height: 200,
                          ),
                        ),
                      ),
                      Positioned.fill(
                        child: Image.asset(
                          'assets/images/dino/벨로시랩터.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      Positioned(
                        left: 5,
                        bottom: 5,
                        child: Text(
                          'Dino $id',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ).toList(),
    );
  }
}
