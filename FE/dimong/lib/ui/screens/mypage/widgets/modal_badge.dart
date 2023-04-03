import 'package:dimong/core/domain/dino.dart';
import 'package:flutter/material.dart';
import './list_badge.dart';
import '../logic/usecase_modal.dart';
import 'package:provider/provider.dart';


class BadgeModal extends StatefulWidget {
  final int id;
  const BadgeModal({Key? key, required this.id}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BadgeModalState();
}

class _BadgeModal extends State<BadgeModal>{
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

  BoxDecoration _colorButton() {
    return BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.white.withOpacity(0.4),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<SendBadgeResponse>>(
        stream: _useCase.dataStream,
        builder: (context, snapshot)
        {
          if(snapshot.hasData && _useCase.isLoading == false)
            {
              return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xffd0ffd7), Color(0xffcaffbd)],
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
                        Container(
                          width: 40.0,
                          height: 40.0,
                          margin: EdgeInsets.only(right:10.0),
                          decoration: _colorButton(),
                          child: Center(
                            child: IconButton(
                              iconSize: 30,
                              icon: const Icon(
                                Icons.cancel_outlined,
                                color: Color(0xff398427),
                              ),
                              onPressed: () => Navigator.of(context).pop(),
                            ),),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Expanded(
                      child: GridView.count(
                        mainAxisSpacing: 8.0,
                        crossAxisCount: 5,
                        childAspectRatio: 0.4, // <-- Set the aspect ratio
                        children: List.generate(30,
                              (index) => MyCardWidget(
                            imageUrl: index % 2 == 0 ? 'assets/images/painting.png' : null,
                          ),
                        ),
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