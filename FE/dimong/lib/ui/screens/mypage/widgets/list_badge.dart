import 'package:flutter/material.dart';

class MyCardWidget extends StatelessWidget {
  final bool? collected;
  final String? badgeName;
  final String? create;

  MyCardWidget({
    this.collected,
    this.badgeName,
    this.create,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Card(
            color: Colors.white.withOpacity(0.9),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            child: Container(
              padding: EdgeInsets.all(10),
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
                    Tooltip(
                      waitDuration: Duration(microseconds: 10),
                      showDuration: Duration(seconds: 2),
                      message: "이름: ${badgeName}\n생성일자: ${create}",
                      child: Image.asset(
                        'assets/badges/${badgeName}.png',
                        width: double.infinity,
                        fit: BoxFit.contain,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
