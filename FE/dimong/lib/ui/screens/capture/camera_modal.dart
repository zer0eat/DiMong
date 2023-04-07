import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dimong/ui/widgets/camera.dart';
import './camera_page.dart';

class CameraModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child:SizedBox(
        width: 290, // Set the desired width
        height: 280, // Set the desired height
        child: Container(
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5,
                spreadRadius: 1.0,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                './assets/images/captureAgain.png',
                width: 200,
                height: 170,
              ),
              Text(
                "공룡이 없어요!",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                    fontFamily: 'KCCDodamdodam',
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 140,
                height: 40,
                child: ElevatedButton(
                  onPressed: () async {
                    Navigator.pop(context);
                    File? image_camera = await getImageFile(ImageSource.camera);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CameraPage(file: File(image_camera!.path)),
                      ),
                    );
                  },
                  child: Text(
                    '다시 찍기',
                    style: TextStyle(color: Colors.black, fontSize: 20,
                      fontFamily: 'KCCDodamdodam',
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xffACC864),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
