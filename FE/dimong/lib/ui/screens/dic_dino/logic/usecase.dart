import 'dart:async';
import 'package:flutter/material.dart';
import 'package:dimong/core/domain/dino.dart';
import '../data/repository.dart';

class DinosaursListUseCase extends ChangeNotifier {
  final DictionaryRepository _repository = DictionaryRepository();
  bool isLoading = false;
  final _dataController = StreamController<List<SendPeriodResponse>>.broadcast();
  Stream<List<SendPeriodResponse>> get dataStream => _dataController.stream;

  Future<void> loadData(String? period) async{
    isLoading = true;
    final data = await _repository.sendPeriod(period);
    _dataController.sink.add(data);
    isLoading = false;
  }
  void dispose(){
    _dataController.close();
  }
}