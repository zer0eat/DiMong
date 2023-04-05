import 'dart:convert';
import 'dart:io';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dimong/core/domain/dino.dart';
import 'package:dimong/ui/screens/gallery/logic/detail_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import '../mypage/widgets/mypage_slider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:flutter_share/flutter_share.dart';

class GalleryImagePage extends StatefulWidget{
  final int drawingId;
  const GalleryImagePage({Key? key, required this.drawingId}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GalleryImagePageState();
}

class _GalleryImagePageState extends State<GalleryImagePage> {
  final GlobalKey _screenshotKey = GlobalKey();
  final ImageUseCase _useCase = ImageUseCase();
  final _controller = ScreenshotController();

  @override
  void initState(){
    super.initState();
    _useCase.loadData(widget.drawingId);
  }


  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DrawingDetailResponse>(
        stream: _useCase.dataStream,
        builder: (context, snapshot){
          if(snapshot.hasData && _useCase.isLoading == false){
            final data = snapshot.data;
            return Screenshot(
                controller: _controller,
                    key: _screenshotKey,
              child: SafeArea(
                child: Scaffold(
                appBar: AppBar(
                // 뒤로가기 버튼
                leading: const BackButton(
                color: Color(0xFFACC864),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          actions: [
          TextButton(
          child: Text('공유하기', style: TextStyle(color: Color(0xffACC864), fontSize: 18, fontWeight: FontWeight.bold)),
          onPressed: () async{
          print('111');
          await shareScreenshot();
          }),
          ],
          ),
          body: Column(children: [
          Text("이 공룡들과 비슷해요!"),
          MypageCard(dinos: data!.similarList!),
          SizedBox(
          height: 30,
          ),
          Container(height: 300, child: CachedNetworkImage(
          imageUrl: data.drawingImageUrl!,
          fit: BoxFit.cover,
          //placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          ),
          SizedBox(
          height:20
          ),
          Container(child: Text('${data.userNickname}', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),))
          ]),

          ),
          )
            );
          }
          else
          {
          return Container();
          }
        }
    );
  }
  Future<void> shareScreenshot() async {
    final directory = await getExternalStorageDirectory();
    final imagePath = '${directory!.path}/image.png';
    final file = File(imagePath);

    try {
      // Capture the screenshot
      final Uint8List? capturedImage = await _controller.capture(delay: Duration(milliseconds: 500));
      print(capturedImage);
      // Write the captured image data to a file
      await file.writeAsBytes(capturedImage!);

      // Share the screenshot
      await FlutterShare.shareFile(
        title: 'Share Screenshot',
        filePath: file.path,
        fileType: 'image/png',
      );
    } catch (e) {
      print('Error sharing screenshot: $e');
    }
  }
}