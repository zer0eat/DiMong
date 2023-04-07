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

  Future<void> loadInfo(int? dinosaurId) async {
    isLoading = true;
    final data = await _repository.sendId(dinosaurId);
    _dataController.sink.add(data);
    isLoading = false;
  }

  void dispose(){
    _dataController.close();
  }
}