import 'dart:developer' as developer;
import 'package:dimong/core/domain/dino.dart';
import 'package:dimong/ui/screens/login/backgroundwidget.dart';
import 'package:dimong/ui/widgets/connect_route.dart';
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
    ConnectRoute _connectRoute = ConnectRoute();
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
                  SendProfileRequest _sendProfileRequest = SendProfileRequest(providerId: authProvider.user.uid, userNickname: authProvider.user.displayName, userEmail: authProvider.user.email, userProfileImage: authProvider.user.photoURL);
                  //로그인 기록이 없으면 라이브러리에 정보를 저장한다.
                  int id = await _secureStorage.getUserId();
                  print("userid 알려줘: $id");
                  // var res;
                  // if(id == -1) {
                  //   print("signup");
                  //   res = await _loginApiClient.sendSignUp(_sendProfileRequest);
                  // }
                  // else if(id==-2){
                  //   res = await _loginApiClient.sendLogin(_sendProfileRequest);
                  //   print("login");
                  // }
                  var res = await _loginApiClient.sendLogin(_sendProfileRequest);
                  print("login");
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
            left: screenWidth * 0.5 - 75,
            child: Image.asset('assets/images/logo.png',
            width: 150,)
          ),
        ],
      ),
    );
  }
}
