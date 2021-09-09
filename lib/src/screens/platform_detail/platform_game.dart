import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:speedoran/src/models/gamemodel.dart';
import 'package:speedoran/src/screens/game_detail/game_detail.dart';
import 'package:speedoran/src/screens/platforms_list/platformstyles.dart';
import 'package:speedoran/src/viewmodels/gameviewmodel.dart';

class PlatformGame extends StatelessWidget{

  final GameModel game;
  PlatformGame(this.game);

  @override
  Widget build(BuildContext context){
    return 
      ListTile(
        title: Text(game.names.international,style: PlatformGameLabelLargeStyle),
        subtitle:Text(game.released.toString(), style: PlatformGameLabelLargeStyle), 
        onTap: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 500),
              transitionsBuilder: (context,animation,animationTime,child){
                animation = CurvedAnimation(parent: animation, curve: Curves.easeIn);              
                return FadeTransition(opacity: animation, child: child);
              },
              pageBuilder: (contex, animation, animationTime){
                return GameDetail(new GameViewModel(id:this.game.id));
              }
          ));
        },
        leading: ClipRRect(borderRadius:  BorderRadius.circular(10.0),
                  child: FadeInImage.assetNetwork(
                    image: game?.assets?.coverLarge?.uri,
                    width: MediaQuery.of(context).size.width * 0.20,
                    fit: BoxFit.fitWidth,
                    placeholder:'assets/images/cover.png',
                    fadeInCurve: Curves.easeIn,
                    fadeInDuration: Duration(milliseconds: 300),
                    )),
    );
  }
}