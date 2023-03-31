import 'dart:io';
import 'dart:typed_data';

import 'package:dimong/core/domain/dino.dart';
import 'package:dimong/ui/screens/drawing/rank_dino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_drawing_board/flutter_drawing_board.dart';
import 'package:dimong/ui/screens/drawing/widgets/src/drawing_board.dart';
import 'package:dimong/ui/screens/drawing/widgets/src/drawing_controller.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import '../../../core/auth/auth_provider.dart';
import './data/imagedata.dart';

class DrawFreePage extends StatefulWidget {
  const DrawFreePage({Key? key}) : super(key: key);

  @override
  State<DrawFreePage> createState() => DrawFreePageState();
}

class DrawFreePageState extends State<DrawFreePage> {
  SendDrawingResponse? liveDrawingResponse;
  final DrawingController _drawingController = DrawingController();
  final DinosaurApiClient dinosaurApiClient = DinosaurApiClient();

  // 실시간
  // Future<void> getImageData() async {
  //   final Uint8List? data =
  //       (await _drawingController.getImageData())?.buffer.asUint8List();
  //   if (data == null) {
  //     return;
  //   }
  //   final sendData = await saveImageToTempDirectory(data);
  //   final SendDrawingResponse liveDrawingResponse =
  //       await dinosaurApiClient.sendImage(sendData);
  //   print('전송 받은 데이터$liveDrawingResponse');
  //   print(liveDrawingResponse.recommendation1);
  // }

  Future<void> saveImageData() async {
    final Uint8List? data =
        (await _drawingController.getImageData())?.buffer.asUint8List();
    if (data == null) {
      return;
    }
    final sendData = await saveImageToTempDirectory(data);
    final SendDrawingResponse saveDrawingResponse =
        await dinosaurApiClient.saveImage(sendData);
  }

  // 저장
  Future<File> saveImageToTempDirectory(Uint8List imageBytes) async {
    final directory = await getTemporaryDirectory();
    final imagePath = '${directory.path}/free_image.png';
    final file = File(imagePath);
    await file.writeAsBytes(imageBytes);
    return file;
  }

  @override
  void dispose() {
    _drawingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final p = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        // 뒤로가기 버튼
        leading: const BackButton(
          color: Color(0xFFACC864),
        ),
        actions: [
          // 제출 버튼
          TextButton(
            onPressed: () {
              saveImageData();
            },
            child: const Text(
              '제출',
              style: TextStyle(
                  fontSize: 17,
                  color: Color(0xFFACC864),
                  fontWeight: FontWeight.w600),
            ),
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return DrawingBoard(
                showDefaultTools: true,
                controller: _drawingController,
                onPointerUp: (pointList) async {
                  liveDrawingResponse = await dinosaurApiClient.sendImage(
                      await saveImageToTempDirectory(
                          (await _drawingController.getImageData())
                                  ?.buffer
                                  .asUint8List() ??
                              Uint8List(0)));
                  setState(() {}); // 상태 업데이트
                },
                background: Container(
                  width: constraints.maxWidth,
                  height: constraints.maxHeight,
                  color: Colors.white,
                ),
                // onPointerUp: getImageData(),
                showDefaultActions: true,
              );
            },
          ),
          RankDino(dinoRanking: liveDrawingResponse),
        ],
      ),
    );
  }
}
