import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './draw_provider.dart';
import 'line_info.dart';
import 'dart:ui' as ui;

class DinoCanvas extends StatefulWidget {
  const DinoCanvas({
    Key? key,
  }) : super(key: key);

  @override
  State<DinoCanvas> createState() => _DinoCanvasState();
}

class _DinoCanvasState extends State<DinoCanvas> {
  // 지정 색상 리스트 <Color>타입
  List<Color> colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.deepPurple,
    Colors.black,
  ];
  @override
  void initState() {
    super.initState();
    // var p = Provider.of<DrawProvider>(context);
    // if (p.lines.isNotEmpty) {
    //   p.eraseAll();
    // }
  }

  // setRenderedImage(BuildContext context) async {
  //   ui.Image renderedImage = await signatureKey.currentState.rendered;
  //
  //   print('image ${renderedImage.toString()}');
  //   setState(() {
  //     image = renderedImage;
  //   });
  //   var pngBytes =
  //       await renderedImage.toByteData(format: ui.ImageByteFormat.png);
  //   Navigator.of(context).push(MaterialPageRoute(
  //       builder: (BuildContext context) => FullScreenImage(
  //             pngBytes: pngBytes,
  //           )));
//    showImage(context);
//   }
  // Future<void> saveImage() async {
  //   try {
  //     final boundary = _globalKey.currentContext.findRenderObject() as RenderRepaintBoundary;
  //     final image = await boundary.toImage();
  //     final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
  //   }
  // }

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
                p.eraseAll();
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
