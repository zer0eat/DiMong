import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:collection';

class RankDino extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final dinoRanking;

  const RankDino({Key? key, required this.dinoRanking}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('데이터가 오나');
    String jsonString = jsonEncode(dinoRanking);
    Map<String, dynamic> response = jsonDecode(jsonString) ?? {};

    Text _rankEmoji(num index) {
      if (index == 1) {
        return Text(
          '🥇',
          style: TextStyle(
            fontSize: 25.0,
          ),
        );
      } else if (index == 2) {
        return Text(
          '🥈',
          style: TextStyle(
            fontSize: 25.0,
          ),
        );
      } else if (index == 3) {
        return Text(
          '🥉',
          style: TextStyle(
            fontSize: 25.0,
          ),
        );
      } else {
        return Text('순위없음');
      }
    }

    print('오긴하나?');
    print(response);
    print(response.runtimeType);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for (num i = 1; i < 4; i++)
          Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5,
                          spreadRadius: 1.0,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Image.asset(
                      fit: BoxFit.contain,
                      'assets/images/dino/${response['recommendation$i']?['dinosaurName']}.png',
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return Image.asset(
                          fit: BoxFit.contain,
                          'assets/images/analyzing.png',
                        );
                      },
                    ),
                  ),
                  Positioned(
                    left: 3,
                    top: 5,
                    child: Container(child: _rankEmoji(i)),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text('${response['recommendation$i']?['dinosaurName'] ?? ''}'),
            ],
          ),
      ],
    );
  }
}
