import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:dimong/core/domain/dino.dart';
import '../data/repository.dart';

class DinoDetailUseCase extends ChangeNotifier {
  final DinoDetailRepository _repository =DinoDetailRepository();
  bool isLoading = false;
  final _dataController = StreamController<SendInfoResponse>.broadcast();
  Stream<SendInfoResponse> get dataStream => _dataController.stream;

  Future<String> loadInfo(int? dinosaurId) async {
    isLoading = true;
    final data = await _repository.sendId(dinosaurId);
    final gptData = await _repository.receiveAudio(dinosaurId);
    _dataController.sink.add(data);
    isLoading = false;
    return gptData['audioSrc'];
  }

  void dispose(){
    _dataController.close();
  }
}