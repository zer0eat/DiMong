import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dimong/ui/screens/drawing/data/data.dart';
import 'package:dimong/ui/screens/dic_dino/widgets/fab_menu.dart';
import 'package:dimong/ui/screens/dic_dino/widgets/dino_grid.dart';
import 'package:dimong/core/domain/dino.dart';
import './logic/usecase.dart';


class DicDino extends StatefulWidget {
  const DicDino({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _DicDinoState();
}

class _DicDinoState extends State<DicDino> {
  final DinosaursListUseCase _useCase = DinosaursListUseCase();
  final era = ["쥐라기", "백악기"];
  late List<SendPeriodResponse> _sendPeriodResponse;
  @override
  void initState(){
    super.initState();
    _useCase.loadData(era[0]);
  }

  @override
  Widget build(BuildContext context) {
    int isIndex =0;
    return StreamBuilder<List<SendPeriodResponse>>(
      stream: _useCase.dataStream,
      builder: (context, snapshot) {
        if(snapshot.hasData && _useCase.isLoading==false){
          final data = snapshot.data!;
          print("11");
          print(data);
          print(data.runtimeType);
          return DefaultTabController(
            length: 2,
            child: SafeArea(
              child: Scaffold(
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(kToolbarHeight),
                  child: Container(
                    color: Colors.transparent,
                    padding: const EdgeInsets.symmetric(
                      vertical: 10.0,),
                    child: TabBar(
                      tabs: [
                        InkWell(
                            child: Tab(text: '쥬라기'),
                            onTap:() async{
                              await _useCase.loadData(era[0]);
                              isIndex =0;
                            }
                        ),
                        InkWell(
                            child: Tab(text: '백악기'),
                            onTap:() async{
                              await _useCase.loadData(era[1]);
                              isIndex =1;
                            }
                        ),
                      ],
                      indicatorColor: const Color(0xFF476930),
                      indicatorSize: TabBarIndicatorSize.label,
                      labelColor: const Color(0xFF476930),
                      labelStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                body: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 10.0),
                  child: TabBarView(
                    children: [
                      Stack(
                        children: [
                          if (isIndex==0)DinoGrid(items: snapshot.data),
                          FabMenu(),
                        ],
                      ),
                      Stack(
                        children: [
                          if(isIndex==1)DinoGrid(items: snapshot.data),
                          FabMenu(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );

        }
        else{
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      }
    );
  }
}
