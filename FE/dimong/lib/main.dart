import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:dimong/ui/screens/login/login_page.dart';
import 'package:dimong/ui/screens/home/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        //'/home': (context) => HomePage(),
      },
    );
  }
}