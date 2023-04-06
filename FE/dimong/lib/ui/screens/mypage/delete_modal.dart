import 'dart:io';
import 'package:flutter/material.dart';
import './data/repository.dart';
import 'package:dimong/ui/widgets/connect_route.dart';

class DeleteModal extends StatelessWidget {
  final int id;
  const DeleteModal({Key? key, required this.id}) : super(key: key);

  Future <void> deleteDrawing(int id) async {
    MyPageRepository _myPageRepository = MyPageRepository();
    await _myPageRepository.deleteDrawing(id);
  }
  @override
  Widget build(BuildContext context) {
    ConnectRoute _connectRoute = ConnectRoute();
    return Center(
      child:SizedBox(
        width: 290, // Set the desired width
        height: 280, // Set the desired height
        child: Container(
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5,
                spreadRadius: 1.0,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                './assets/images/captureAgain.png',
                width: 200,
                height: 170,
              ),
              Text(
                "그림을 삭제하시겠습니까?",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'KCCDodamdodam',
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 90,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () async {
                        print("넹");
                        deleteDrawing(id);
                        print("삭제");
                        Navigator.pop(context);
                        _connectRoute.toMyPage(context);
                      },
                      child: Text(
                        '네',
                        style: TextStyle(color: Colors.black, fontSize: 20,
                          fontFamily: 'KCCDodamdodam',
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xffACC864),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 90,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () async {
                        print("아니오");
                        Navigator.pop(context);
                      },
                      child: Text(
                        '아니오',
                        style: TextStyle(color: Colors.black, fontSize: 20,
                          fontFamily: 'KCCDodamdodam',
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xffACC864),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),

                ],
               )
            ],
          ),
        ),
      ),
    );
  }
}
