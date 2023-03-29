import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import './draw_provider.dart';
import 'line_info.dart';
import 'dart:async';
import './data/imagedata.dart';

class DinoCanvas extends StatefulWidget {
  const DinoCanvas({
    Key? key,
  }) : super(key: key);

  @override
  State<DinoCanvas> createState() => _DinoCanvasState();
}

class _DinoCanvasState extends State<DinoCanvas> {
  // 지정 색상 리스트 <Color>타입
  final DinosaurApiClient dinosaurApiClient = DinosaurApiClient();
  List<Color> colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.deepPurple,
    Colors.black,
  ];
  GlobalKey _globalKey = GlobalKey();
  @override
  void initState() {
    super.initState();
    // var p = Provider.of<DrawProvider>(context);
    // if (p.lines.isNotEmpty) {
    //   p.eraseAll();
    // }
  }

  Future<void> _handleSavePressed() async {
// // Create a temporary file to save the image
    final recorder = PictureRecorder();
    Canvas canvas = Canvas(recorder);
    final picture = recorder.endRecording();
    print(picture.runtimeType);
    final image = await picture.toImage(300, 500);
    print(image.runtimeType);
    final pngBytes = await image.toByteData(format: ImageByteFormat.png);
    print(pngBytes.runtimeType);
    final directory = await getTemporaryDirectory();
    print(directory.path);
    final imagePath = '${directory.path}/image.png';

    final imageFile = File(imagePath);
    //await imageFile.writeAsBytes(imageBytes);
    print(imageFile.runtimeType);

    final imageToSend =
        await saveImageToTempDirectory(pngBytes!.buffer.asUint8List());
    await dinosaurApiClient.sendImage(imageToSend);
  }

  Future<File> saveImageToTempDirectory(Uint8List imageBytes) async {
    final directory = await getTemporaryDirectory();
    final imagePath = '${directory.path}/my_image.png';
    final file = File(imagePath);
    await file.writeAsBytes(imageBytes);
    return file;
  }
// Save the image to the file
//     await imageFile.writeAsBytes(img.encodePng(image));
//     // try {
//     final RenderRepaintBoundary boundary =
//         _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
//     print('11111 $boundary');
//     ui.Image image = await boundary.toImage(pixelRatio: 3.0);
//     print('22222 $image');
//     ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
//     Uint8List pngBytes = byteData!.buffer.asUint8List();
//     print(pngBytes);
//     return pngBytes;

  @override
  Widget build(BuildContext context) {
    var p = Provider.of<DrawProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          // Expanded -> Expanded 없는 부분 영역 제외 모든 영역을 가져감
          // 그림판
          Expanded(
              child: Stack(children: [
            Positioned.fill(
              // 그림 그릴 영역 제공
              child: CustomPaint(
                painter: DrawingPainter(p.lines),
              ),
            ),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              // 처음 눌렀을 때 값 전달
              onPanStart: (s) {
                if (p.eraseMode) {
                  p.erase(s.localPosition);
                } else {
                  p.drawStart(s.localPosition);
                }
              },

              // 움직일 때 값 전달
              onPanUpdate: (s) {
                if (p.eraseMode) {
                  p.erase(s.localPosition);
                } else {
                  p.drawing(s.localPosition);
                }
              },
            )
          ])),

          // 색 선택 버튼
          Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                colors.length,
                (index) => _ChooseColor(colors[index]),
              ),
            ),
          ),
          Row(children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Slider(
                  activeColor: Colors.grey,
                  inactiveColor: Colors.grey.shade300,
                  thumbColor: Colors.grey,
                  value: p.size,
                  onChanged: (size) {
                    p.changeSize = size;
                  },
                  min: 1,
                  max: 30,
                ),
              ),
            ),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                p.changeEraseMode();
                p.changeColor = Colors.white;
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Text(
                  '지우개',
                  style: TextStyle(
                    fontSize: 17,
                    color: p.eraseMode ? Color(0xFFACC864) : Colors.black,
                    fontWeight:
                        p.eraseMode ? FontWeight.w900 : FontWeight.normal,
                  ),
                ),
              ),
            ),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                _handleSavePressed();
                // capturePng();
                // p.eraseAll();
              },
              child: const Padding(
                  padding: EdgeInsets.only(left: 10, right: 20),
                  child: Text(
                    '전체지우기',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  )),
            ),
          ]),
        ],
      ),
    );
  }

  Widget _ChooseColor(Color color) {
    var p = Provider.of<DrawProvider>(context);
    bool isSelected = p.color == color;
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        if (p.eraseMode) p.changeEraseMode();
        p.changeColor = color;
      },
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white,
            width: isSelected ? 5 : 1,
          ),
        ),
      ),
    );
  }
}

class DrawingPainter extends CustomPainter {
  DrawingPainter(this.lines);
  final List<List<LineInfo>> lines;
  // final recorder = PictureRecorder();
  // final canvas = Canvas(recorder);
  @override
  void paint(Canvas canvas, Size size) {
    for (var oneLine in lines) {
      Color? color;
      double? size;
      var l = <Offset>[];
      var p = Path();
      for (var i = 0; i < oneLine.length; i++) {
        var oneDot = oneLine[i];
        // ??= null일 때만 값 지정
        color ??= oneDot.color;
        size ??= oneDot.size;
        l.add(oneDot.offset);
        if (i == 0) {
          //moveTo로 시작점 설정
          p.moveTo(oneDot.offset.dx, oneDot.offset.dy);
        }
      }
      p.addPolygon(l, false);
      canvas.drawPath(
          p,
          Paint()
            ..color = color!
            ..strokeWidth = size!
            ..strokeCap = StrokeCap.round
            ..style = PaintingStyle.stroke);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
