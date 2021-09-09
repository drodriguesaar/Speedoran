import 'package:speedoran/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:gradient_text/gradient_text.dart';
import 'package:speedoran/src/utils/videoicon.dart';
import 'package:speedoran/src/utils/countryflags.dart';
import 'package:speedoran/src/viewmodels/gameviewmodel.dart';
import 'package:speedoran/src/screens/user_detail/user_detail.dart';

class ModeratorsList extends StatelessWidget{
  ModeratorsList(this._game);
  final GameViewModel _game;

  void openRunUrl(String uri){
    if(uri.isEmpty){
      return;
    }
    canLaunch(uri).then((value) => launch(uri));
  }
  
  @override
  Widget build(BuildContext context){
    return Container(
      alignment: Alignment.centerLeft,
      child: Expanded(
        flex: 1,
        child: Flex(
          mainAxisAlignment: MainAxisAlignment.start,
          children: 
          this._game.moderators.map((e) => 
            ListTile(
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
                      return UserDetail(e.id);
                    }
                ));
              },
              title: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GradientText(e.name, style: ModeratorNameText,textAlign: TextAlign.left, gradient: e.nameColor)
              ]),
              subtitle: Text(e.country ?? "", style: GameSubTitleTextDetail),
              visualDensity: VisualDensity.compact,
              dense: true,
              leading: Image.asset(CountryFlags.getFlag(e.country ?? ""), width: 30, fit: BoxFit.fitWidth),
              contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              trailing: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children:e.socialMediaList.where((element) => element != null).map((e) => IconButton(
                    icon: VideoIcon.getIcon(e),
                    onPressed:()=>openRunUrl(e))).toList()))).toList(), 
                direction: Axis.vertical)));
  }
}