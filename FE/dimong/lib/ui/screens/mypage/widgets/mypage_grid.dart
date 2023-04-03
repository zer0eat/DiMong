import 'package:flutter/material.dart';

class MypageGrid extends StatefulWidget {
  final List<dynamic>? imageList;
  const MypageGrid({Key? key, required this.imageList}) : super(key: key);

  @override
  _MypageGridState createState() => _MypageGridState();
}

class _MypageGridState extends State<MypageGrid> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.imageList!.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 3.0,
                    blurRadius: 5.0)
              ],
              color: Colors.white
          ),
            child: Image.network(widget.imageList![index]["myDrawingUrl"], fit: BoxFit.contain),
            /*Text(
              '그림 $index',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),*/
        );
      },
    );
  }
}
