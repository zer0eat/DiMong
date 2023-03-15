import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  final String imagePath;
  final Color backgroundColor;
  final AlignmentGeometry alignment;

  const BackgroundWidget({Key? key,
    required this.imagePath,
    this.backgroundColor = Colors.white,
    this.alignment = Alignment.bottomCenter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.contain,
          alignment: alignment,
        ),
      ),
    );
  }
}