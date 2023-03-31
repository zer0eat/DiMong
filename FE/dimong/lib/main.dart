import 'package:dimong/ui/widgets/navbar.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:dimong/ui/screens/login/login_page.dart';
import 'package:dimong/ui/screens/home/home_page.dart';
import 'package:dimong/ui/screens/drawing/drawing.dart';
import 'package:dimong/core/auth/auth_provider.dart';
import 'package:dimong/ui/screens/drawing/dino_canvas.dart';
import 'package:provider/provider.dart';
import 'package:dimong/ui/screens/drawing/draw_provider.dart';
import 'package:dimong/route.dart';
import 'package:dimong/ui/screens/dic_detail/dic_detail.dart';
import 'package:dimong/ui/screens/mypage/mypage.dart';
import 'package:dimong/ui/screens/dic_detail/gauge.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => DrawProvider(), child: DinoCanvas()),
        ChangeNotifierProvider<AuthProvider>(
          create: (_) => AuthProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'My App',
        initialRoute: RoutePaths.login,
        routes: {
          RoutePaths.login: (context) => LoginPage(),
          RoutePaths.home: (context) => HomePage(),
          RoutePaths.dinoDictionary: (context) => const NavBar(index: 1),
          RoutePaths.drawingMain: (context) => const NavBar(index: 2),
          RoutePaths.myInfo: (context) => const NavBar(index: 3),
        },
        onGenerateRoute: (settings) {
          switch (settings.name){
            case RoutePaths.dinoDetail:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                  builder: (context) => DinoDetail(id: id));
            case RoutePaths.navBar:
              final index = settings.arguments as int;
              return MaterialPageRoute(
                  builder: (context) => NavBar(index: index));
          }
          return null;
        },
      ),
    );
  }
}
