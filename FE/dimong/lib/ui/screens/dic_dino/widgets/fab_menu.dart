import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:dimong/ui/widgets/camera.dart';
import 'package:dimong/ui/screens/capture/camera_page.dart';
import 'package:dimong/ui/screens/capture/gallery_page.dart';
import 'package:image_picker/image_picker.dart';

class FabMenu extends StatefulWidget {
  const FabMenu({super.key});

  // const FabMenu({super.key});

  @override
  State<FabMenu> createState() => _FabMenuState();
}

class _FabMenuState extends State<FabMenu> with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  int _angle = 90;

  late AnimationController _animationController;
  late Animation<double> _buttonAnimatedIcon;

  @override
  initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 50),
    );

    _buttonAnimatedIcon = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.0, 2, curve: Curves.linear),
    );

    _animationController.reverse();
    super.initState();
  }

  // 애니메이션 종료
  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  _rotate() {
    setState(() {
      if (_isExpanded) {
        _angle = 45;
        _isExpanded = false;
        _animationController.forward();
      } else {
        _angle = 90;
        _isExpanded = true;
        _animationController.reverse();
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
          bottom: 138.0,
          right: 18.0,
          child: Row(
            children: [
              ScaleTransition(
                scale: _buttonAnimatedIcon,
                alignment: FractionalOffset.center,
                child: Material(
                    color: const Color(0xFFFFFFFF),
                    type: MaterialType.circle,
                    elevation: 5.0,
                    child: GestureDetector(
                      child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: InkWell(
                            onTap: () async{
                              File? image_camera = await getImageFile(ImageSource.camera);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder:
                                        (context) =>  CameraPage(file: File(image_camera!.path)),
                              //const CameraPage()),
                              ),
                              );
                            },
                            child: const Center(
                              child: Icon(
                                size: 30.0,
                                Icons.camera_alt_rounded,
                                color: Color(0xFFACC864),
                              ),
                            ),
                          )),
                    )),
              ),
            ],
          )),
      Positioned(
          bottom: 80.0,
          right: 18.0,
          child: Row(
            children: [
              ScaleTransition(
                scale: _buttonAnimatedIcon,
                alignment: FractionalOffset.center,
                child: Material(
                    color: const Color(0xFFFFFFFF),
                    type: MaterialType.circle,
                    elevation: 5.0,
                    child: GestureDetector(
                      child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: InkWell(
                            onTap: () async{
                              File? image_gallery = await getImageFile(ImageSource.gallery);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) =>  GalleryPage(file: File(image_gallery!.path)),
                                  //const CameraPage()),
                                ),
                              );
                            },
                            child: const Center(
                              child: Icon(
                                size: 30.0,
                                Icons.image,
                                color: Color(0xFFACC864),
                              ),
                            ),
                          )),
                    )),
              ),
            ],
          )),
      Positioned(
        bottom: 16.0,
        right: 16.0,
        child: Material(
          color: const Color(0xFF476930),
          type: MaterialType.circle,
          elevation: 6.0,
          child: GestureDetector(
            child: SizedBox(
              width: 56.0,
              height: 56.0,
              child: InkWell(
                onTap: _rotate,
                child: Center(
                  child: Icon(
                    size: 30.0,
                    Icons.add_a_photo_rounded,
                    color: Color(0xFFFFFFFF),
                    )
                  ),
                )
              ),
            )
          ),
       ),
     ]
    );
  }
}

