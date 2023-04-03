import 'package:flutter/material.dart';
import 'package:dimong/core/domain/dino.dart';
import 'package:dimong/ui/screens/home/connect_home.dart';
import 'package:shaky_animated_listview/animators/grid_animator.dart';
import 'package:shaky_animated_listview/animators/shake_transition.dart';
import 'package:shaky_animated_listview/scroll_animator.dart';
import 'package:shaky_animated_listview/widgets/animated_gridview.dart';
import 'package:shaky_animated_listview/widgets/animated_listview.dart';

class DinoGrid extends StatefulWidget {
  final List<SendPeriodResponse>? items;
  const DinoGrid({Key? key, required this.items}) : super(key: key);

  @override
  State<DinoGrid> createState() => _DinoGridState();
}

class _DinoGridState extends State<DinoGrid> {
  final ConnectRoute _connectRoute = ConnectRoute();

  BoxDecoration _tasteColor(bool collected, String taste) {
    if (!collected) {
      return const BoxDecoration(
        color: Colors.grey,
      );
    } else if (taste == '초식') {
      return const BoxDecoration(
        color: Color(0xFFACC864),
      );
    } else {
      return const BoxDecoration(
        color: Color(0xFFB08B60),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: widget.items!.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          final item = widget.items![index];
          return GridAnimatorWidget(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Container(
                    // margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(7),
                    decoration: _tasteColor(item.collected!, item.dinosaurTaste!),
                    child: GestureDetector(
                      onTap: () async{
                        print("movePage with dinosaurId: ${item.dinosaurId}");
                        await _connectRoute.toDinoDetail(context, item.dinosaurId!);
                      },
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
                          Positioned(
                              right: 1,
                              top: 1,
                              child: Text(item.dinosaurTaste! == '초식' ? '🌿' : '🍖',
                                style: TextStyle(
                                  fontSize: 25.0,
                                ),)
                          ),
                          item.collected! ? Positioned.fill(
                            child: Image.asset(
                              'assets/images/dino/${item.dinosaurName}.png',
                              fit: BoxFit.contain,
                            ),
                          ) : Positioned.fill(
                            child: Image.asset(
                              'assets/images/dino/물음표.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                          Positioned(
                            left: 1,
                            bottom: 1,
                            child: Text(
                              item.dinosaurName!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                          ),
                     ]),
                    )
                ),
              ),
            ),
          );
        }
    );
  }
}
