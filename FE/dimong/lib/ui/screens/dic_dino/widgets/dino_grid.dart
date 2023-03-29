import 'package:flutter/material.dart';
import 'package:dimong/core/domain/dino.dart';
import 'package:dimong/ui/screens/home/connect_home.dart';

class DinoGrid extends StatefulWidget {
  final List<SendPeriodResponse>? items;
  const DinoGrid({Key? key, required this.items}) : super(key: key);
  @override
  State<DinoGrid> createState() => _DinoGridState();
}

class _DinoGridState extends State<DinoGrid> {
  final ConnectRoute _connectRoute = ConnectRoute();
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: widget.items!.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        final item = widget.items![index];
        return Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xFFACC864),
          ),
          child: GestureDetector(
            onTap: () async{
              await _connectRoute.toDinoDetail(context, index);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                //Image.network(item.dinosaurImageUrl!),
                Text(
                  item.dinosaurName!,
                )
              ]
            ),
          )
        );
      }
    );
  }
}
