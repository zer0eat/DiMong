import 'dart:io';
import 'package:dimong/ui/screens/capture/data/repository.dart';
import 'package:dimong/ui/screens/capture/logic/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dimong/ui/widgets/camera.dart';
import 'package:dimong/ui/modals/modal.dart';
import 'package:dimong/core/api/api.dart';
import '../../widgets/connect_route.dart';
import './data/data.dart';
import 'package:dimong/core/api/api.dart';
import './data/repository.dart';
import './loading_image.dart';
import 'package:provider/provider.dart';
import 'package:dimong/ui/screens/dic_detail/dic_detail.dart';
import './gallery_modal.dart';

// Camera Widget을 생성
class GalleryPage extends StatefulWidget {
  final File? file;
  GalleryPage({required this.file});

  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  final CameraRepository _cameraRepository = CameraRepository();
  final picker = ImagePicker();
  File? _image;
  void initState() {
    super.initState();
    _image = widget.file;
  }

  // 이미지를 보여주는 위젯
  Widget showImage() {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.83,
      child: _image == null
          ? Center(child: Text('No image selected.'))
          : Image.file(File(_image!.path)),
    );
  }

  void _showModal() async {
    /*await showModalBottomSheet(
       context: context,
       builder: (context) => CameraModal()
     );*/
    await showCupertinoModalPopup(
        context: context, builder: (context) => GalleryModal());
  }

  @override
  Widget build(BuildContext context) {
    // 화면 세로 고정
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    ConnectRoute _connectRoute = ConnectRoute();
    return Scaffold(
      backgroundColor: Colors.black,
      body: ChangeNotifierProvider(
          create: (_) => CameraViewModel(
              repository: CameraRepository(), imageFile: widget.file!),
          child: Consumer<CameraViewModel>(builder: (_, viewModel, __) {
            return Stack(
              children: [
                // SizedBox(height: 25.0),
                showImage(),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () async {
                          File? image_gallery =
                              await getImageFile(ImageSource.gallery);
                          if (image_gallery != null) {
                            _image = File(image_gallery.path);
                            viewModel.analyzeImage(_image);
                          }
                        },
                        child: Text(
                          '다시 불러오기',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xff6B6B6B), // Set button color
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(10) // Set button shape
                              ),
                        ),
                      ),
                      Container(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(
                                0xffACC864), // Set the background color of the button
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10) // Set button shape
                                ), // Set the shape of the button to a circle
                          ),
                          onPressed: () async {
                            if (_image != null) {
                              if (viewModel.isLoading) {
                                Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                          '~/assets/images/analyzing.png'),
                                      SizedBox(height: 16),
                                      CircularProgressIndicator(),
                                    ],
                                  ),
                                );
                              } else {
                                print(viewModel.dinosaurs!.dinosaurId);
                                bool foundCheck = viewModel.dinosaurs!.found!;
                                int id = viewModel.dinosaurs!.dinosaurId!;
                                if (viewModel.dinosaurs!.dinosaurId != null) {
                                  if (foundCheck = true && id >= 0) {
                                    print("dinosaur 있어요");
                                    print("found!: $foundCheck");
                                    Navigator.pop(context);
                                    _connectRoute.toDinoDetail(context,
                                        viewModel.dinosaurs!.dinosaurId!);
                                  } else {
                                    _showModal();
                                  }
                                }
                              }
                              setState(() {
                                _image = widget.file;
                              });
                            }
                          },
                          child: Text('분석하기', style: TextStyle(fontSize: 16)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          })),
    );
  }
}
