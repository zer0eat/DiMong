import 'package:flutter/material.dart';

class LoadingModal extends StatefulWidget {
  final bool visible;
  final String subText;

  const LoadingModal({
    super.key,
    required this.visible,
    required this.subText,
  });

  @override
  _LoadingModalState createState() => _LoadingModalState();
}

class _LoadingModalState extends State<LoadingModal> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color.fromRGBO(255, 255, 255, 0.5),
      content: Container(
        width: 50,
        height: 280,
        child: const Center(
          child: Column(
            children: [
              Image(
                image: AssetImage('assets/images/loading.gif'),
              ),
              Text(
                '분석중입니다',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              LinearProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
