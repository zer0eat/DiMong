import 'package:flutter/material.dart';

class MyCardWidget extends StatelessWidget {
  final String? imageUrl;

  MyCardWidget({
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (imageUrl != null)
              Image.network(
                imageUrl!,
                height: 80,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            if (imageUrl == null)
              Container(
                height: 80,
                width: double.infinity,
                color: Colors.grey.withOpacity(0.5),
              ),
          ],
        ),
      ),
    ),);
  }
}