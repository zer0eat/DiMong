import 'package:dimong/core/domain/dino.dart';
import 'package:flutter/material.dart';
import './list_badge.dart';
import '../logic/usecase_modal.dart';
import 'package:provider/provider.dart';


class BadgeModal extends StatefulWidget {
  final int id;
  const BadgeModal({Key? key, required this.id}) : super(key: key);

  @override
  _BadgeModalState createState() => _BadgeModalState();
}

class _BadgeModalState extends State<BadgeModal>{
  final BadgeUseCase _useCase = BadgeUseCase();
  @override
  void initState(){
    super.initState();
    _useCase.loadBadge(widget.id);
  }
  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<SendBadgeResponse>>(
        stream: _useCase.dataStream,
        builder: (context, snapshot)
        {
          if(snapshot.hasData && _useCase.isLoading == false)
            {
              final data = snapshot.data!;
              print(data);
              print("length: ${data.length}");
              print(data.runtimeType);
              return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xCCACC864), Color(0x33E1F1B6)],
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: 40.0,
                            height: 40.0,
                            child: IconButton(iconSize: 40, icon: const Icon(Icons.cancel_outlined, color: Color(0xff476930),),
                              onPressed: () => Navigator.of(context).pop(),),),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Expanded(
                      child: GridView.count(
                        crossAxisCount: 3,
                        childAspectRatio: 1, // <-- Set the aspect ratio
                        children: List.generate(data.length,
                              (index) => MyCardWidget(
                                badgeName: data[index].badgeName,
                                collected: data[index].collected,
                                create: data[index].createdAt,
                              ),
                        ),
                        padding: EdgeInsets.all(10),
                      ),
                    ),
                  ],
                ),
              );
            }
          else return Container();
        }
    );

  }
}
