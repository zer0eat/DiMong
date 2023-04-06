import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dimong/ui/screens/home/home_page.dart';
import 'package:dimong/route.dart';
import 'package:dimong/ui/widgets/navbar.dart';
import 'package:dimong/ui/screens/dic_detail/dic_detail.dart';
import 'package:dimong/ui/screens/capture/camera_page.dart';
import 'package:dimong/ui/screens/capture/gallery_page.dart';
import 'package:dimong/ui/screens/mypage/myimage.dart';
import 'package:dimong/ui/screens/mypage/mypage.dart';
import 'package:dimong/ui/screens/gallery/gallery_image.dart';

class ConnectRoute{
  Future<void> toPage(BuildContext context, String route) async{
    await Navigator.pushReplacementNamed(context, route);
  }
  Future<void> toHome(BuildContext context) async{
    await Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()),
    );
  }
  Future <void>toNavBar(BuildContext context, dynamic arguments) async{
    await Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NavBar(index: arguments)),
    );
  }
  Future <void>toDinoDetail(BuildContext context, int index) async{
    await Navigator.push(context, MaterialPageRoute(builder: (context) => DinoDetail(id: index)));
  }
  Future<void> toCameraPage(BuildContext context, File? imageFile) async{
    await Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CameraPage(file: imageFile!)));
  }
  Future<void> toCameraStack(BuildContext context, File? imageFile) async{
    await Navigator.push(context, MaterialPageRoute(builder: (context) => CameraPage(file: imageFile!)));
  }
  Future<void> toGalleryStack(BuildContext context, File? imageFile) async{
    await Navigator.push(context, MaterialPageRoute(builder: (context) => GalleryPage(file: imageFile!)));
  }
  Future<void> toMyImage(BuildContext context, int drawingId) async{
    await Navigator.push(context, MaterialPageRoute(builder: (context) => MyImagePage(drawingId: drawingId)));
  }
  Future<void> toMyPage(BuildContext context) async{
    await Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NavBar(index: 4)));
  }
  Future<void> toOtherImage(BuildContext context, int drawingId) async{
    await Navigator.push(context, MaterialPageRoute(builder: (context) => GalleryImagePage(drawingId: drawingId)));
  }

  Future<void> toPages(BuildContext context, String route, dynamic arguments) async{
    final index = arguments;
    await Navigator.pushReplacementNamed(context, '$route'+'/'+'$index');
  }
}

class ConnectHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Add the following line to navigate to the login page automatically
    ConnectRoute connectRoute = ConnectRoute();
    print(RoutePaths.home);
    connectRoute.toHome(context);
    // Return an empty container to prevent the widget from being displayed
    return Container();
  }
}