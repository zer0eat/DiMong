import 'package:dimong/ui/screens/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dimong/core/auth/auth_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dimong/ui/screens/mypage/mypage_grid.dart';

import 'Badge_card.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final String displayName = authProvider.user.displayName!;
    final photoUrl = authProvider.user.photoURL;

    print(authProvider.user.displayName);
    print(authProvider.user.photoURL);
    print('1111111');

    return Scaffold(
      body: ListView(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 20),
              child:
              Column(
                children: [
                  Container(
                    child: Column(
                      // mainAxisSize: MainAxisSize.max,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Card(
                            color: Color(0xFFACC864),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(60),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(60),
                                child: Image.network(
                                  authProvider.user.photoURL!,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                          child:
                              Text(
                                displayName,
                              ),
                          ),
                        ElevatedButton(
                          child: Text('Logout'),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            primary: Color(0xFFACC864), // Background color
                            onPrimary: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              vertical: 6,
                              horizontal: 15,
                            ),// Text Color (Foreground color)
                          ),

                          onPressed: () async {
                            // 눌렀을 때 두 번째 route로 이동합니다.
                            await authProvider.logout();
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LoginPage()),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child:
                          Text(
                            '뱃지 목록',
                          ),
                        ),
                        BadgeCards()
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                            child:
                            Text(
                              '내 그림 정보',
                            ),
                          ),
                          MypageGrid()
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}