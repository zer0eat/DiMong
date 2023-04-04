import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dimong/core/auth/auth_provider.dart';
//import 'package:dimong/modules/user_profile/user_provider.dart';
import 'package:dimong/ui/screens/login/google_login_page.dart';
import 'package:dimong/ui/screens/home/home_page.dart';
import 'package:dimong/ui/widgets/background.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
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
                await authProvider.loginWithGoogle();
                if (authProvider.isSignedIn) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                }
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
