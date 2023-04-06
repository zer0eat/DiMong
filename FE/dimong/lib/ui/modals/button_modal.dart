import 'package:flutter/material.dart';

class ButtonModal extends StatelessWidget {
  // navigate pop할지 이동할지 상태
  final bool isBack;
  final String subText, buttonText, img;

  const ButtonModal(
      {super.key,
      required this.isBack,
      required this.subText,
      required this.buttonText,
      required this.img});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      content: Container(
        width: 50,
        height: 280,
        child: Center(
          child: Column(
            children: [
              Image(
                image: AssetImage(img),
              ),
              Text(subText),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(buttonText),
        ),
      ],
    );
  }
}
// class CenterModal extends StatefulWidget {
//   // final Text contextText;
//   final double width;
//
//   const CenterModal({
//     super.key,
//     // this.contextText = '텍스트',
//     this.width = 40,
//   });
//
//   @override
//   State<CenterModal> createState() => _CenterModalState();
// }
//
// class _CenterModalState extends State<CenterModal> {
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: Colors.transparent,
//       child: Center(
//           child: ClipRRect(
//         borderRadius: BorderRadius.circular(20),
//         child: Container(
//           color: Colors.white,
//           width: 260,
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 50,
//               ),
//               Container(
//                 margin: EdgeInsets.only(
//                   left: 15,
//                   right: 15,
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Container(
//                 decoration: BoxDecoration(
//                   border: Border(
//                     bottom: BorderSide(
//                       color: Colors.green,
//                       width: 1,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       )),
//     );
//   }
// }
