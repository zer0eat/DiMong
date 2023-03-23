import 'package:flutter/material.dart';
import './line_info.dart';
import 'dart:math';

class DrawProvider extends ChangeNotifier {
  final lines = <List<LineInfo>>[];

  double _size = 1;
  Color _color = Colors.black;
  bool _eraseMode = false;

  double get size => _size;
  set changeSize(double size) {
    _size = size;
    notifyListeners();
  }

  Color get color => _color;
  set changeColor(Color color) {
    _color = color;
    notifyListeners();
  }

  bool get eraseMode => _eraseMode;
  void changeEraseMode() {
    _eraseMode = !_eraseMode;
    notifyListeners();
  }

  // 라인 시작
  void drawStart(Offset offset) {
    var oneLine = <LineInfo>[];
    oneLine.add(LineInfo(offset, size, color));
    lines.add(oneLine);
    notifyListeners();
  }

  // 라인 이동
  void drawing(Offset offset) {
    lines.last.add(LineInfo(offset, size, color));
    notifyListeners();
  }

  // 선 삭제
  void erase(Offset offset) {
    final eraseGap = 15;
    for (var oneLine in List<List<LineInfo>>.from(lines)) {
      for (var oneDot in oneLine) {
        if (sqrt(pow((offset.dx - oneDot.offset.dx), 2) +
                pow((offset.dy - oneDot.offset.dy), 2)) <
            eraseGap) {
          lines.remove(oneLine);
          break;
        }
      }
    }
    notifyListeners();
  }

  // 전체 삭제
  void eraseAll() {
    lines.clear();
    notifyListeners();
  }
}
