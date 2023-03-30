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
    _useCase.loadData();
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
            return SafeArea(
              child: Scaffold(
                // appBar: PreferredSize(
                //   preferredSize: const Size.fromHeight(10),
                //   child: Container(
                //     color: Colors.transparent,
                //     padding: const EdgeInsets.symmetric(
                //       vertical: 10.0,),
                //   ),
                // ),
                body: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Stack(
                    children: [
                    DinoGrid(items: snapshot.data),
                    FabMenu(),
                  ]),
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
