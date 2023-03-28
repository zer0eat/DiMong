import 'dart:io';
import 'package:dimong/ui/screens/capture/data/repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './logic/view.dart';
import '../dic_dino/dic_detail.dart';

class ProgressScreen extends StatelessWidget {
  final File? imageFile;
  const ProgressScreen({Key? key, required this.imageFile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CameraViewModel(
        repository: CameraRepository(), imageFile: imageFile
      ),
      child: Scaffold(
        body: Consumer<CameraViewModel>(
          builder: (context, viewModel, child)
          {
            if (viewModel.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            else {
                if(viewModel.dinosaurs!.dinosaurId != null) Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DinoDetail(id: viewModel.dinosaurs!.dinosaurId!)));
                return Container();
            }
          },
        ),
      ),
    );
  }
}