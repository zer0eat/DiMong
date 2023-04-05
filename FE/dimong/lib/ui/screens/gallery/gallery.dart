import 'package:dimong/core/domain/dino.dart';
import 'package:dimong/ui/screens/gallery/logic/usecase.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dimong/core/auth/auth_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dimong/ui/screens/gallery/widgets/gallery_grid.dart';

class Gallery extends StatefulWidget {
  const Gallery({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  final GalleryUseCase _useCase = GalleryUseCase();
  late SendProfileResponse _profileResponse;
  @override
  void initState(){
    super.initState();
    _useCase.loadData();
  }
  
  Future<void> _refreshData() async {
    await _useCase.loadData();
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
                body: RefreshIndicator(
                  onRefresh: () async {
                    await _useCase.loadData();
                  },
                  child: ListView(
                    children: [
                      Center(
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child:
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Container(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(15),
                                        child:
                                        Text(
                                          '모두의 갤러리',
                                          style: TextStyle(
                                            color: Color(0xFFACC864),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 40,
                                          ),
                                        ),
                                      ),
                                      GalleryGrid(imageList: data!.myDrawingList!)
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
