import 'package:dimong/core/domain/dino.dart';
import 'package:flutter/material.dart';
import '../../gallery//data/data_drawing.dart';
import 'package:dimong/ui/widgets/connect_route.dart';

class GalleryGrid extends StatefulWidget {
  final List<AllDrawingResponse>? imageList;
  final VoidCallback? onReachedEnd;
  GalleryGrid({Key? key, required this.imageList, this.onReachedEnd}) : super(key: key);

  @override
  _GalleryGridState createState() => _GalleryGridState();
}

class _GalleryGridState extends State<GalleryGrid> {
  ConnectRoute _connectRoute = ConnectRoute();
  GalleryDrawingApiClient _galleryDrawingApiClient = GalleryDrawingApiClient();
  final ScrollController _scrollController = ScrollController();
  late bool _isLoading;

  @override
  void initState() {
    super.initState();
    _isLoading = false;
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.offset >= _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      if (!_isLoading) {
        setState(() {
          _isLoading = true;
        });
        widget.onReachedEnd?.call();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: _scrollController,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.imageList!.length + (_isLoading ? 1 : 0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        if (index == widget.imageList!.length) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        final imageIndex = widget.imageList!.length - 1 - index;
        return GestureDetector(
          onTap: () async {
            print(widget.imageList![index].runtimeType);
            print("그림 정보: ${widget.imageList![index]}");
            final res = await _galleryDrawingApiClient.sendDrawing(widget.imageList![imageIndex].drawingId);
            print("그림 상세: ${res.runtimeType}");
            print("그림 상세 url: ${res.drawingImageUrl}");
            print("그림 상세 리스트: ${res.similarList.runtimeType}");
            _connectRoute.toMyImage(context, res.similarList, res.drawingImageUrl);
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 3.0,
                      blurRadius: 5.0)
                ],
                color: Colors.white),
            child: Image.network(widget.imageList![imageIndex].myDrawingUrl!,
                fit: BoxFit.contain),
          ),
        );
      },
    );
  }
}
