import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:dimong/core/domain/dino.dart';
import '../data/repository.dart';

class BadgeUseCase extends ChangeNotifier {
  final MyPageRepository _repository =MyPageRepository();
  bool isLoading = false;
  final _dataController = StreamController<List<SendBadgeResponse>>.broadcast();
  Stream<List<SendBadgeResponse>> get dataStream => _dataController.stream;

  Future<void> loadBadge(int? dinosaurId) async {
    isLoading = true;
    final data = await _repository.sendBadge(dinosaurId);
    _dataController.sink.add(data);
    isLoading = false;
  }

  void dispose(){
    _dataController.close();
  }
}