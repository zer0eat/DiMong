import 'package:flutter/material.dart';

class BadgeCards extends StatelessWidget {
  const BadgeCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 50.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5.0,
                  ),
                ],
              ),
              child: IconButton(
                icon: Icon(Icons.ac_unit_rounded),
                onPressed: () {},
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10.0,
                  ),
                ],
              ),
              child: IconButton(
                icon: Icon(Icons.apple_rounded),
                onPressed: () {},
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10.0,
                  ),
                ],
              ),
              child: IconButton(
                icon: Icon(Icons.auto_awesome_rounded),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
