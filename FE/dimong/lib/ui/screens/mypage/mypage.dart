import 'package:dimong/ui/screens/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dimong/core/auth/auth_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final String displayName = authProvider.user.displayName!;
    final photoUrl = authProvider.user.photoURL;

    print(authProvider.user.displayName);
    print(authProvider.user.photoURL);

    return Scaffold(
      body: Center(
          child:Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 40, 20, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        displayName,
                      ),
                      // style: FlutterFlowTheme.of(context).title3.override(
                      //   fontFamily: 'Lexend Deca',
                      //   color: Colors.white,
                      //   fontSize: 20,
                      //   fontWeight: FontWeight.bold,
                      // ),
                      // ),
                    ],
                  ),
                ),
                ElevatedButton(
                  child: Text('Logout'),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFACC864), // Background color
                    onPrimary: Colors.white, // Text Color (Foreground color)
                  ),
                  onPressed: () async{
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
          )

        //   ElevatedButton(
        //   child: Text('Logout'),
        //   onPressed: () async{
        //     // 눌렀을 때 두 번째 route로 이동합니다.
        //     await authProvider.logout();
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(builder: (context) => LoginPage()),
        //     );
        //   },
        // )
      ),
    );
  }
}