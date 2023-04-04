import 'package:flutter/material.dart';

class MyCardWidget extends StatelessWidget {
  final bool? collected;
  final String? badgeName;

  MyCardWidget({
    this.collected,
    this.badgeName,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (collected == false)
              Image.asset(
                'assets/egg/${badgeName}.png',
                width: double.infinity,
                fit: BoxFit.contain,
              ),
            if (collected == true)
              Image.asset(
                'assets/badges/${badgeName}.png',
                width: double.infinity,
                fit: BoxFit.contain,
              ),
          ],
        ),
      ),
    ),);
  }
}