import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dimong/ui/widgets/camera.dart';
import 'package:dimong/ui/modals/modal.dart';
import 'package:dimong/core/network/network.dart';

// Camera Widget을 생성
class CameraPage extends StatefulWidget {
  final File file;
  CameraPage({required this.file});

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {

  final picker = ImagePicker();
  File? _image;
  DioService dioService = DioService();
  void initState(){
    super.initState();
    _image = widget.file!=null ? File(widget.file.path) : null;
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
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.black,
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
                          File? image_camera = await getImageFile(ImageSource.camera);
                          if(image_camera!=null)
                          {
                            _image = File(image_camera.path);
                          }
                        },
                        child: Text(
                          '다시 찍기',
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
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xffACC864), // Set the background color of the button
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10) // Set button shape
                            ), // Set the shape of the button to a circle
                          ),
                          onPressed: () async{
                            if(_image!=null) {
                              // 통신 코드 추가 밑에 modalText에 결과 출력
                              int? id = await dioService.sendImage(_image);
                              showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return TextModal(modalText: id.toString());
                                },
                              );
                              setState(() {
                                _image = widget.file;
                              });
                            }
                          },
                          child: Text('Upload', style: TextStyle(fontSize: 16)),
                        ),
                      ),
                    ],

                  ),
                ),
              ),
            ],
          ),
        )
    );

  }
}