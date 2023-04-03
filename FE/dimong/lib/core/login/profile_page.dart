import 'package:dimong/ui/screens/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dimong/core/auth/auth_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dimong/ui/screens/mypage/widgets/mypage_grid.dart';
import './user_service.dart';
import 'package:dimong/ui/screens/mypage/widgets/Badge_card.dart';
import 'package:dimong/ui/screens/mypage/widgets/mypage_slider.dart';

class UserProfilePage extends StatefulWidget {
  final UserService _userService;
  UserProfilePage({required UserService userService})
      : _userService = userService;

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}


class _UserProfilePageState extends State<UserProfilePage> {
  String? _email;
  String? _fullName;
  String? _profileImageUrl;

  @override
  void initState() {
    super.initState();
    // Load the user's profile information when the widget is initialized
    _loadUserProfile();
  }

  Future<void> _loadUserProfile() async {
    final userProfile = await widget._userService.getUserProfile();
    if (userProfile != null) {
      setState(() {
        _email = userProfile.email;
        _fullName = userProfile.fullName;
        _profileImageUrl = userProfile.profileImageUrl;
      });
    }
  }

  Future<void> _handleLogout() async {
    // TODO: Implement logout functionality
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final String displayName = authProvider.user.displayName!;
    final photoUrl = authProvider.user.photoURL;

    print(authProvider.user.displayName);
    print(authProvider.user.photoURL);
    print('1111111');

    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 20),
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
                            padding: const EdgeInsets.all(10.0),
                            child: Card(
                              color: Color(0xFFACC864),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(60),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(60),
                                  child: Image.network(
                                    _profileImageUrl!,
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 10.0,),
                            child:
                            Text(
                              _fullName!,
                              style: const TextStyle(
                                color: Color(0xFF444444),
                                fontWeight: FontWeight.bold,
                                // fontSize: 20,
                              ),
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
                              await _handleLogout();
                              Navigator.pushReplacement(
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
                            padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                            child:
                            Text(
                                '뱃지 목록',
                                style: TextStyle(
                                  color: Color(0xFFACC864),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                )
                            ),
                          ),
                          BadgeCards()
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: const Column(
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                              child:
                              Text(
                                '내 그림',
                                style: TextStyle(
                                  color: Color(0xFFACC864),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
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
      ),
    );
  }
}