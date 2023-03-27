import 'package:flutter/material.dart';
import 'package:dimong/core/auth/auth_provider.dart';
import 'package:provider/provider.dart';
// class DrawingDino extends StatelessWidget{
//   const DrawingDino({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context){
//     return Center(
//       child: Text('This is Painting'),
//     );
//   }
// }
class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('First Route'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Open route'),
          onPressed: () {
            // 눌렀을 때 두 번째 route로 이동합니다.
            authProvider.logout();
          },
        ),
      ),
    );
  }
}
