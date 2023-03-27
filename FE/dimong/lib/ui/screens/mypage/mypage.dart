import 'package:dimong/core/login/google_api_login.dart';
import 'package:dimong/ui/screens/login/login_page.dart';
import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Route'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Logout'),
          onPressed: () {
            // 눌렀을 때 두 번째 route로 이동합니다.
            GoogleSignInApi.logout();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          },
        ),
      ),
    );
  }
}

