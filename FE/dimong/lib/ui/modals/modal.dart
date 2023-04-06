import 'package:flutter/material.dart';

class TextModal extends StatelessWidget {
  final String modalText;

  const TextModal({Key? key, required this.modalText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        height: 200,
        color: Colors.white,
        child: Text(modalText),
      ),
    );
  }
}