import 'package:flutter/material.dart';
import 'package:dimong/core/domain/dino.dart';
import '../data/repository.dart';


class DinosaursListViewModel extends ChangeNotifier {
  final DictionaryRepository _repository;

  List<SendPeriodResponse> _dinosaurs = [];
  bool _isLoading = true;

  DinosaursListViewModel({required DictionaryRepository repository})
      : _repository = repository {
    _fetchDinosaurs(null);
  }

  List<SendPeriodResponse> get dinosaurs => _dinosaurs;
  bool get isLoading => _isLoading;

  Future<void> _fetchDinosaurs(String? period) async {
    _isLoading = true;
    notifyListeners();
    try {
      _dinosaurs = await _repository.sendPeriod(period);
    } catch (e) {
      // Handle the error as needed
    }
    _isLoading = false;
    notifyListeners();
  }
}