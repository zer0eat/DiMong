import 'dart:async';
import 'package:flutter/material.dart';
import 'package:dimong/core/domain/dino.dart';
import '../data/repository.dart';

class ImageUseCase extends ChangeNotifier {
  final MyPageRepository _repository = MyPageRepository();
  bool isLoading = false;
  final _dataController = StreamController<DrawingDetailResponse>.broadcast();
  Stream<DrawingDetailResponse> get dataStream => _dataController.stream;

  Future<void> loadData(int? drawingId) async{
    isLoading = true;
    final data = await _repository.sendDrawing(drawingId);
    _dataController.sink.add(data);
    isLoading = false;
  }
  void dispose(){
    _dataController.close();
  }
}