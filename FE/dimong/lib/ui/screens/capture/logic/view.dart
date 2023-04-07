import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dimong/core/domain/dino.dart';
import '../data/repository.dart';

class CameraViewModel extends ChangeNotifier {
  final CameraRepository _repository;

  SendImageResponse? _dinosaurs;
  bool _isLoading = true;

  CameraViewModel({required CameraRepository repository, required File? imageFile})
      : _repository = repository{
    analyzeImage(imageFile);
  }

  SendImageResponse? get dinosaurs => _dinosaurs;
  bool get isLoading => _isLoading;

  Future<void> analyzeImage(File? image) async {
    _isLoading = true;
    notifyListeners();
    try {
      _dinosaurs = await _repository.sendImage(image);
    } catch (e) {
      // Handle the error as needed
    }
    _isLoading = false;
    notifyListeners();
  }
}
