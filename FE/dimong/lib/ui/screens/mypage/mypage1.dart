import 'package:dimong/ui/screens/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dimong/core/auth/auth_provider.dart';


class MyPage1 extends StatelessWidget {
  const MyPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('Logout'),
          onPressed: () async{
            // 눌렀을 때 두 번째 route로 이동합니다.
            await authProvider.logout();
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

