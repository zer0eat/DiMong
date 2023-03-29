import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {
  final String name, dino;
  final IconData icon;
  final bool isInverted;

  const CurrencyCard({
    super.key,
    required this.name,
    required this.icon,
    required this.isInverted,
    required this.dino,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      height: 180,
      margin: const EdgeInsets.all(5),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: isInverted ? Colors.white : const Color(0xFFACC864),
        borderRadius: BorderRadius.circular(10),
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
        padding: const EdgeInsets.all(7),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(dino),
              width: 80,
              height: 100,
            ),
            Column(
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
