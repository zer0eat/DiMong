import 'package:dimong/core/domain/dino.dart';
import 'package:dimong/ui/screens/login/login_page.dart';
import 'package:dimong/ui/screens/mypage/logic/usecase.dart';
import 'package:dimong/ui/screens/mypage/widgets/modal_badge.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dimong/core/auth/auth_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dimong/ui/screens/mypage/widgets/mypage_grid.dart';

import 'widgets/Badge_card.dart';
import './widgets/mypage_slider.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyPageState();
}


class _MyPageState extends State<MyPage> {
  final MyPageUseCase _useCase = MyPageUseCase();
  late SendProfileResponse _profileResponse;
  @override
  void initState(){
    super.initState();
    _useCase.loadData();
  }
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final String displayName = authProvider.user.displayName!;
    final photoUrl = authProvider.user.photoURL;
    //print(authProvider.user.displayName);
    //print(authProvider.user.photoURL);
    //print('1111111');
    return StreamBuilder<SendProfileResponse>(
      stream: _useCase.dataStream,
      builder: (context, snapshot){
        if (snapshot.hasData && _useCase.isLoading == false){
          final data =snapshot.data;
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
                                    color: Colors.transparent,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(60),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(60),
                                        child: Image.network(
                                          authProvider.user.photoURL!,
                                          //data!.userProfileImage!,
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
                                    displayName,
                                    //data!.userNickname,
                                    style: const TextStyle(
                                      color: Color(0xFF444444),
                                      fontWeight: FontWeight.bold,
                                      // fontSize: 20,
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  child: Text('로그아웃'),
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
                                /*Padding(
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
                                ),*/
                                //BadgeCards()
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                  child: ElevatedButton(
                                    child: Text('뱃지 목록'),
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
                                    onPressed: () async{
                                      await showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        builder: (BuildContext context) {
                                          return BadgeModal();
                                        },
                                      );
                                    },
                                  )
                                  ,
                                  /*IconButton(
                              iconSize: 50,
                              icon: Image.asset('assets/images/badge.png'),
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  builder: (BuildContext context) {
                                    return BadgeModal(id: 1);
                                  },
                                );
                              },
                            ),*/
                                ),
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
                                      '내 그림',
                                      style: TextStyle(
                                        color: Color(0xFFACC864),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  MypageGrid(imageList: data!.myDrawingList!)
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
        else
          {
            return Container();
          }
      }
    );
  }
}
