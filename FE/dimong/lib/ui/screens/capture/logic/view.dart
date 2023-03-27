import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dimong/core/domain/dino.dart';
import '../data/repository.dart';

class CameraViewModel extends ChangeNotifier {
  final CameraRepository _repository;
  final File? _imageFile;

  SendImageResponse? _dinosaurs;
  bool _isLoading = true;

  CameraViewModel({required CameraRepository repository, required File? imageFile})
      : _repository = repository,
        _imageFile = imageFile {
    _loadingImage();
  }

  SendImageResponse? get dinosaurs => _dinosaurs;
  bool get isLoading => _isLoading;

  Future<void> _loadingImage() async {
    _isLoading = true;
    notifyListeners();
    try {
      _dinosaurs = await _repository.sendImage(_imageFile);
    } catch (e) {
      // Handle the error as needed
    }
    _isLoading = false;
    notifyListeners();
  }
}
