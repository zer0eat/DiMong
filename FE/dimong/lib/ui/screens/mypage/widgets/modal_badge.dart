import 'package:flutter/material.dart';
import './list_badge.dart';

class BadgeModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('Close'),
              ),
            ],
          ),
          SizedBox(height: 16),
          Expanded(
            child: GridView.count(
              mainAxisSpacing: 8.0,
              crossAxisCount: 5,
              childAspectRatio: 0.8, // <-- Set the aspect ratio
              children: List.generate(
                30,
                    (index) => MyCardWidget(
                  hasImage: index % 2 == 0,
                  imageUrl: index % 2 == 0 ? 'assets/images/painting.png' : null,
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}