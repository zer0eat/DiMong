import 'package:flutter/material.dart';

class BadgeCards extends StatelessWidget {
  const BadgeCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: 7,
          horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
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
                icon: Icon(Icons.people),
                onPressed: () {},
              ),
            ),
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
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
                icon: Icon(Icons.settings),
                onPressed: () {},
              ),
            ),
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
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
                icon: Icon(Icons.help),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
