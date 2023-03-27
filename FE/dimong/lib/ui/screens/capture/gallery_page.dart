import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dimong/ui/widgets/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dimong/ui/modals/modal.dart';
import './data/data.dart';

// Camera Widget을 생성
class GalleryPage extends StatefulWidget {
  final File file;
  GalleryPage({required this.file});

  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  final cameraClient  = CameraApiClient();
  final picker = ImagePicker();
  File? _image;
  void initState(){
    super.initState();
    _image = widget.file;
  }
  // 이미지를 보여주는 위젯
  Widget showImage() {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height* 0.83,
      child: _image == null
          ? Center(child: Text('No image selected.'))
          : Image.file(File(_image!.path)),
    );
  }

  @override
  Widget build(BuildContext context) {
    // 화면 세로 고정
    //DioService dioService = DioService();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // SizedBox(height: 25.0),
          showImage(),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () async{
                      File? image_down = await getImageFile(ImageSource.gallery);
                      _image = File(image_down!.path);
                    },
                    child: Text(
                      '다시 불러오기',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff6B6B6B), // Set button color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10) // Set button shape
                      ),
                    ),
                  ),
                  Container(
                    height: 64,
                    width: 64,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffACC864),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.upload_file),
                      color: Colors.white,
                      onPressed: () async{
                        if(widget.file!=null) {
                          final res = await cameraClient.sendImage(_image);
                          print(res);
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return TextModal(modalText: '123123');
                            },
                          );
                          setState(() {
                            _image = widget.file;
                          });
                        }

                      },
                    ),
                  ),
                ],

              ),
            ),
          ),
        ],
      ),
    );
  }
}