import 'package:dimong/core/domain/dino.dart';
import 'package:flutter/material.dart';
import '../../mypage/data/data_drawing.dart';
import 'package:dimong/ui/widgets/connect_route.dart';

class GalleryGrid extends StatefulWidget {
  final List<dynamic>? imageList;
  const GalleryGrid({Key? key, required this.imageList}) : super(key: key);

  @override
  _GalleryGridState createState() => _GalleryGridState();
}

class _GalleryGridState extends State<GalleryGrid> {
  ConnectRoute _connectRoute = ConnectRoute();
  MyDrawingApiClient _myDrawingApiClient = MyDrawingApiClient();
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
        final imageIndex = widget.imageList!.length - 1 - index;
        return GestureDetector(
          onTap:() async{
            print(widget.imageList![index].runtimeType);
            print("그림 정보: ${widget.imageList![index]}");
            final res = await _myDrawingApiClient.sendDrawing(widget.imageList![imageIndex]['drawingId'], 1);
            print("그림 상세: ${res.runtimeType}");
            print("그림 상세 url: ${res.drawingImageUrl}");
            print("그림 상세 리스트: ${res.similarList.runtimeType}");
            _connectRoute.toMyImage(context, res.similarList, res.drawingImageUrl);
          },
          child:Container(
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
            child: Image.network(widget.imageList![imageIndex]["myDrawingUrl"], fit: BoxFit.contain),
            /*Text(
              '그림 $index',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),*/
          ),
        );
      },
    );
  }
}
