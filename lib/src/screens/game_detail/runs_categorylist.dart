import 'package:speedoran/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:gradient_text/gradient_text.dart';
import 'package:speedoran/src/utils/trophies.dart';
import 'package:speedoran/src/utils/videoicon.dart';
import 'package:speedoran/src/utils/formatters.dart';
import 'package:speedoran/src/viewmodels/gameviewmodel.dart';
import 'package:speedoran/src/screens/user_detail/user_detail.dart';

class RunsCategoryList extends StatelessWidget
{
  RunsCategoryList(this._game);

  void openRunUrl(String uri){
    if(uri.isEmpty){
      return;
    }
    canLaunch(uri).then((value) => launch(uri));
  }
  
  final GameViewModel _game;

  @override
  Widget build(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: this._game.runs.isEmpty ? 
        [ListTile(title: 
          Row(crossAxisAlignment: CrossAxisAlignment.center, 
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(child: Container(
                child: Text("No runs yet on this category", textAlign: TextAlign.left, style: NoRunsText))) 
            ]))] :
        this._game.runs.map((e) => 
          ListTile(
            onTap: (){
              Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: Duration(milliseconds: 500),
                    transitionsBuilder: (context,animation,animationTime,child){
                      animation = CurvedAnimation(parent: animation, curve: Curves.easeIn);              
                      return FadeTransition(opacity: animation, child: child);
                    },
                    pageBuilder: (contex, animation, animationTime){
                      return UserDetail(e.runnerID);
                    }
                ));
            },
            contentPadding: EdgeInsets.only(left: 0, right:0),
            dense: true,
            visualDensity: VisualDensity.compact,
            trailing:IconButton(
              icon: VideoIcon.getIcon(e.video), 
              iconSize:30, 
              onPressed:()=>openRunUrl(e.video)),
            leading: Flexible(
              child: Container(
                alignment: Alignment.center,
                width:40,
                child: Trophies.formatTrophy(e.place))),
            subtitle: Text("Platform: ${e.platform.isEmpty ? "not available" : e.platform}", style: ModeratorLevelText),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  fit: FlexFit.loose,
                  flex: 1,
                  child: Container(
                    width: 30,
                    alignment: Alignment.centerLeft,
                    child: Text(Formatters.formatPlacing(e.place), style: PlacingText))),
                Flexible(
                  fit: FlexFit.loose,
                  flex: 0,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: GradientText(e.player, 
                          style: RunnerText, 
                          textAlign: TextAlign.left, 
                          gradient: e.nameColor))),
                Flexible(
                  fit: FlexFit.loose,
                  flex: 0,
                  child: Container(
                    padding: EdgeInsets.only(left: 5.0),
                    alignment: Alignment.center,
                    child:Row(children:[Text("-", textAlign: TextAlign.start, style:TextStyle(fontSize: 18, fontWeight:FontWeight.w500)), Text(Formatters.formatTime(e.time ?? " not available"), style: TimeText, textAlign: TextAlign.end)]))),
              ]),
          )).toList());
  }
}