import 'package:flutter/material.dart';
import './dino_canvas.dart';

// class DrawingDino extends StatelessWidget{
//   const DrawingDino({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context){
//     return Center(
//       child: Text('This is Painting'),
//     );
//   }
// }
class DrawingDino extends StatelessWidget {
  const DrawingDino({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Route'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Open route'),
          onPressed: () {
            // 눌렀을 때 두 번째 route로 이동합니다.
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DinoCanvas()),
            );
          },
        ),
      ),
    );
  }
}
//
// class DrawingDino extends StatefulWidget {
//   const DrawingDino({Key? key}) : super(key: key);
//
//   @override
//   State<DrawingDino> createState() => _DrawingDinoState();
// }
//
// class _DrawingDinoState extends State<DrawingDino> {
//   Color selectedColor = Colors.black;
//   List<Color> colors = [
//     Colors.red,
//     Colors.orange,
//     Colors.yellow,
//     Colors.green,
//     Colors.blue,
//     Colors.deepPurple,
//     Colors.black,
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           // Expanded -> Expanded 없는 부분 영역 제외 모든 영역을 가져간다.
//           Expanded(
//               child: Stack(children: [
//             GestureDetector(
//               // 처음 눌렀을 때 값 전달
//               onPanStart: (s) {},
//               // 움직일 때 값 전달
//               onPanUpdate: (s) {},
//             )
//           ])),
//           Container(
//             color: Colors.grey[300],
//             padding: EdgeInsets.all(10),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: List.generate(
//                 colors.length,
//                 (index) => _ChooseColor(colors[index]),
//               ),
//             ),
//           ),
//           Row(children: [
//             Expanded(
//               child: Padding(
//                 padding: EdgeInsets.all(10),
//                 child: Slider(
//                   activeColor: selectedColor,
//                   inactiveColor: Colors.grey.shade200,
//                   value: 1,
//                   onChanged: (size) {},
//                   min: 1,
//                   max: 30,
//                 ),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.only(left: 20, right: 5),
//               child: Text(
//                 'erase',
//                 style: TextStyle(fontSize: 20),
//               ),
//             )
//           ]),
//         ],
//       ),
//     );
//   }
//
//   Widget _ChooseColor(Color color) {
//     bool isSelected = selectedColor == color;
//     return GestureDetector(
//       behavior: HitTestBehavior.translucent,
//       onTap: () => setState(() => selectedColor = color),
//       child: Container(
//         height: 40,
//         width: 40,
//         decoration: BoxDecoration(
//           color: color,
//           shape: BoxShape.circle,
//           border: Border.all(
//             color: Colors.white,
//             width: 3,
//           ),
//         ),
//       ),
//     );
//   }
// }
