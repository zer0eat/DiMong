import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:dimong/ui/screens/dic_dino/widgets/fab_menu.dart';
import 'package:dimong/ui/screens/dic_dino/widgets/dino_grid.dart';
import 'package:dimong/core/domain/dino.dart';
import '../../widgets/camera.dart';
import '../capture/camera_page.dart';
import '../capture/gallery_page.dart';
import './logic/usecase.dart';

class DicDino extends StatefulWidget {
  const DicDino({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DicDinoState();
}

class _DicDinoState extends State<DicDino> {
  final DinosaursListUseCase _useCase = DinosaursListUseCase();
  late List<SendPeriodResponse> _sendPeriodResponse;

  @override
  void initState() {
    super.initState();
    _useCase.loadData();
  }

  Future<void> _refreshData() async {
    await _useCase.loadData();
  }

  @override
  Widget build(BuildContext context) {
    int isIndex = 0;
    return StreamBuilder<List<SendPeriodResponse>>(
        stream: _useCase.dataStream,
        builder: (context, snapshot) {
          if (snapshot.hasData && _useCase.isLoading == false) {
            final data = snapshot.data!;
            print("11");
            print(data);
            print(data.runtimeType);
            return SafeArea(
              child: Scaffold(
                floatingActionButton: SpeedDial(
                  overlayColor: Colors.transparent,

                  mini: false,
                  // renderOverlay: true,
                  icon: Icons.add_a_photo_rounded,
                  backgroundColor: Color(0xFF476930),
                  activeIcon: Icons.close,
                  // buttonSize: 56.0,
                  visible: true,
                  direction: SpeedDialDirection.up,
                  children: [
                    SpeedDialChild(
                      child: Icon(Icons.image_rounded),
                      foregroundColor: Color(0xFFACC864),
                      onTap: () async {
                        File? image_gallery =
                            await getImageFile(ImageSource.gallery);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                GalleryPage(file: File(image_gallery!.path)),
                            //const CameraPage()),
                          ),
                        );
                      },
                    ),
                    SpeedDialChild(
                      child: Icon(Icons.camera_alt_rounded),
                      foregroundColor: Color(0xFFACC864),
                      onTap: () async {
                        File? image_camera =
                            await getImageFile(ImageSource.camera);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                CameraPage(file: File(image_camera!.path)),
                            //const CameraPage()),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                body: RefreshIndicator(
                  onRefresh: _refreshData,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Stack(children: [
                      DinoGrid(items: snapshot.data),
                      Container(
                      alignment: Alignment.topRight,
                      margin: const EdgeInsets.all(16.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xFFACC864),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 5.0,
                            ),
                          ],
                        ),
                        child: IconButton(
                          icon: Icon(Icons.question_mark_rounded,
                            color: Colors.white,),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor: Colors.transparent,
                                  content: Image.asset('assets/images/dino_guide.png'),
                                );
                              },
                            );
                          },
                        ),
                      ),)
                      // FabMenu(),
                    ]),
                  ),
                ),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
