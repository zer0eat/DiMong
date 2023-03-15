import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {
  final String name, subText, dino;
  final IconData icon;
  final bool isInverted, xDirection;

  const CurrencyCard({
    super.key,
    required this.name,
    required this.subText,
    required this.icon,
    required this.isInverted,
    required this.xDirection,
    required this.dino,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: isInverted ? Colors.white : const Color(0xFFACC864),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 2,
            // offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Row(
          mainAxisAlignment: xDirection
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.start,
          children: [
            Container(
              alignment: const AlignmentDirectional(-100, -100),
              child: Image(
                image: AssetImage(dino),
                width: 100,
                alignment: const AlignmentDirectional(-100, -100),
              ),
            ),
            Column(
              crossAxisAlignment: xDirection
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                // 메뉴 아이콘
                Icon(icon,
                    shadows: const <Shadow>[
                      Shadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                      )
                    ],
                    color: isInverted ? const Color(0xFFACC864) : Colors.white,
                    size: 30),

                // 메뉴 이름
                Text(
                  name,
                  style: TextStyle(
                    color: isInverted ? const Color(0xFFACC864) : Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                Row(
                  children: [
                    Text(
                      subText,
                      style: const TextStyle(
                        color: Color(0xFF6B6B6B),
                        fontSize: 12,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _dinoImg() {
    return Positioned(
      top: -100,
      child: Image(
        image: AssetImage(dino),
        width: 100,
      ),
    );
  }
}
