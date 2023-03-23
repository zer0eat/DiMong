import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:developer' as developer;
import 'package:provider/provider.dart';
import 'package:dimong/modules/user_profile/user_provider.dart';
import 'package:dimong/ui/widgets/google_api_login.dart';
import 'package:dimong/ui/screens/login/google_login_page.dart';
import 'package:dimong/ui/widgets/navbar.dart';
import 'package:dimong/ui/widgets/background.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  Future<UserCredential?> loginWithGoogle(BuildContext context) async {
    GoogleSignInAccount? user = await GoogleSignInApi.login();

    GoogleSignInAuthentication? googleAuth = await user!.authentication;
    var credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken
    );

    UserCredential? userCredential = await FirebaseAuth.instance
        .signInWithCredential(credential);

    if (userCredential != null) {
      print('로그인 성공 === Google');
      print(userCredential);

      // UserProvider에 UserCredential 데이터 저장
      Provider.of<UserProvider>(context, listen: false)
          .setUserCredential(userCredential);

      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => NavBar()
      ));
    } else {
      print('로그인 실패');
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('로그인 실패 === Google')
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Material(
      child: Stack(
        children: [
          BackgroundWidget(
            imagePath: 'assets/images/background_image1.png',
            backgroundColor: Colors.white,
            alignment: Alignment.bottomCenter,
          ),
          Positioned(
            top: screenHeight * 0.5,
            left: 0,
            right: 0,
            child: IconButton(
              icon: Image.asset('assets/images/login_btn_google.png'),
              iconSize: 50.0,
              onPressed: () async {
                await loginWithGoogle(context);
              },
            ),
          ),
          Positioned(
            top: screenHeight * 0.3,
            left: screenWidth * 0.30,
            child: Text(
              '디몽',
              style: TextStyle(
                fontSize: 80.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
