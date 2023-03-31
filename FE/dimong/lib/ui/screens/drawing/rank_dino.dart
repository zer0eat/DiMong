import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:collection';

class RankDino extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final dinoRanking;
  const RankDino({Key? key, required this.dinoRanking}) : super(key: key);

  // Map dinoRank = dinoRanking.toMap();

  @override
  Widget build(BuildContext context) {
    // print('오긴하나?');
    // if (dinoRanking == null) {
    //   return Container();
    // }
    // print(dinoRanking);
    // print(dinoRanking.runtimeType);
    // List<Map<String, dynamic>> entries =
    //     List.from(persons.map((person) => person.toMap()));
    // final entries = dinoRanking?.toList();
    // print(entries);
    // print(entries.runtimeType);
    return Container();
    //final rankingMap = dinoRanking?.toMap();
    //print("이이잉$rankingMap");
    //final entries = rankingMap?.entries.toList();

    // return ListView.builder(
    //   itemCount: entries.length,
    //   itemBuilder: (context, index) {
    //     final entry = entries[index];
    //     final ranking = entry.key;
    //     final dinoData = entry.value as Map<String, dynamic>;
    //     final dinoName = dinoData['dinosaurName'] as String;
    //     final dinoImageUrl = dinoData['dinosaurImageUrl'] as String;
    //     return ListTile(
    //       leading: Image.network(dinoImageUrl),
    //       title: Text(dinoName),
    //       trailing: Text('Rank: $ranking'),
    //     );
    //   },
    // );
  }
}
//
//       Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
//       //
//       // })
//       Container(
//         width: 100,
//         height: 100,
//         decoration: BoxDecoration(
//             color: Colors.red,
//             borderRadius: BorderRadius.circular(
//               10,
//             )),
//       ),
//       Container(
//         width: 100,
//         height: 100,
//         decoration: BoxDecoration(
//             color: Colors.red,
//             borderRadius: BorderRadius.circular(
//               10,
//             )),
//       ),
//       Container(
//         width: 100,
//         height: 100,
//         decoration: BoxDecoration(
//             color: Colors.red,
//             borderRadius: BorderRadius.circular(
//               10,
//             )),
//       ),
//     ]);
//   }
// }
