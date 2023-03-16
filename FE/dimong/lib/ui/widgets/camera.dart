import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

// Camera Widget을 생성
class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  //아래 cameradimongstate와 연결
  // data가 변경되면 state class로부터 변경된 widget을 받아 보여준다.
  @override
  _CameraPageState createState() => _CameraPageState();
}

// state: 앱에서 사용되는 data들을 의미
// 위의 cameradimong class와 연결
// data가 바뀌면 state class는 위 widget에 data 변경된 widget을 만들어 보내준다.
class _CameraPageState extends State<CameraPage> {
  File? _image; //File? = declare the variable, File object or nullable
  //final 재할당불가 선언
  final picker = ImagePicker();

  // 비동기 처리를 통해 카메라와 갤러리에서 이미지를 가져온다.
  // Future은 async / await 작업을 위한 선언의 한종류
  Future getImage(ImageSource imageSource) async {
    final image = await picker.pickImage(source: imageSource);
    //state update method
    setState(() {
      _image = File(image!.path); // 가져온 이미지를 _image에 저장
    });
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

    return Scaffold(
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
                  Container(
                    height: 64,
                    width: 64,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffACC864),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.add_a_photo),
                      color: Colors.white,
                      onPressed: () {
                        getImage(ImageSource.camera);
                      },
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
                      icon: Icon(Icons.wallpaper),
                      color: Colors.white,
                      onPressed: () {
                        getImage(ImageSource.gallery);
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