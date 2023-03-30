import 'package:flutter/material.dart';
import 'package:dimong/ui/screens/home/connect_home.dart';
class CurrencyCard extends StatelessWidget {
  final String name, dino, route;
  final int argument;
  final IconData icon;
  final bool isInverted;

  const CurrencyCard({
    super.key,
    required this.name,
    required this.icon,
    required this.isInverted,
    required this.dino,
    required this.route,
    required this.argument,
  });

  @override
  Widget build(BuildContext context) {
    ConnectRoute connectRoute = ConnectRoute();
    return InkWell(
      child: Container(
        padding: const EdgeInsets.all(2),
        height: 180,
        margin: const EdgeInsets.all(5),
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFffffff),Color(0x33ACC864)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
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
      ),
      onTap: () async {
        print('To route: $route');
        await connectRoute.toNavBar(context, argument);
      },
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
