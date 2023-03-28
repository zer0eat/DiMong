import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './logic/view.dart';

class DinoDetail extends StatelessWidget {
  final int id;
  const DinoDetail({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text(id.toString()),
          onPressed: () async{
          },
        ),
      ),
    );
  }
}

