import 'package:flutter/material.dart';

class RankDino extends StatelessWidget {
  RankDino({Key? key}) : super(key: key);

  List DinoRanking = [
    {
      "recommendation1": {
        "dinosaurId": 1,
        "dinosaurImageUrl": "공룡이미지1",
        "dinosaurName": "티라노사우루스"
      },
      "recommendation2": {
        "dinosaurId": 2,
        "dinosaurImageUrl": "공룡이미지2",
        "dinosaurName": "벨로시랩터"
      },
      "recommendation3": {
        "dinosaurId": 3,
        "dinosaurImageUrl": "공룡이미지3",
        "dinosaurName": "트리케라톱스"
      },
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      //
      // })
      Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(
              10,
            )),
      ),
      Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(
              10,
            )),
      ),
      Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(
              10,
            )),
      ),
    ]);
  }
}
