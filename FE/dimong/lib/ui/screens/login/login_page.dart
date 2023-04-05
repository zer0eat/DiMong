import 'dart:developer' as developer;
import 'package:dimong/core/domain/dino.dart';
import 'package:dimong/ui/screens/login/backgroundwidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dimong/core/auth/auth_provider.dart';
//import 'package:dimong/modules/user_profile/user_provider.dart';
import 'package:dimong/ui/screens/login/google_login_page.dart';
import 'package:dimong/ui/screens/home/home_page.dart';
import 'package:dimong/ui/widgets/background.dart';
import 'package:dimong/core/local_storage/secure_storage.dart';
import 'package:dimong/ui/screens/login/data/data.dart';
import 'backgroundwidget.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SecureStorage _secureStorage = SecureStorage();
    LoginApiClient _loginApiClient = LoginApiClient();
    final authProvider = Provider.of<AuthProvider>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Material(
      child: Stack(
        children: [
          BackgroundImageWidget(),
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
                  //로그인 기록이 없으면 라이브러리에 정보를 저장한다.
                  int id = await _secureStorage.getUserId();
                  SendProfileRequest _sendProfileRequest = SendProfileRequest(providerId: authProvider.user.uid, userNickname: authProvider.user.displayName, userEmail: authProvider.user.email, userProfileImage: authProvider.user.photoURL);
                  late final res;
                  if(id == -1) {
                      res = await _loginApiClient.sendSignUp(_sendProfileRequest);
                    }
                  else{
                    res = await _loginApiClient.sendLogin(_sendProfileRequest);
                  }
                  await _secureStorage.setUserId(res.userId);
                  await _secureStorage.setRefreshToken(res.accessToken);
                  print("refresh token received: ${res.accessToken}");
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
            child: Image.asset('assets/images/login_btn_google.png',
            width: 150,)
          ),
        ],
      ),
    );
  }
}
