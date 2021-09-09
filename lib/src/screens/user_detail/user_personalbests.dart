import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'package:speedoran/src/utils/trophies.dart';
import 'package:speedoran/src/utils/formatters.dart';
import 'package:speedoran/src/models/personalbestmodel.dart';
import 'package:speedoran/src/viewmodels/gameviewmodel.dart';
import 'package:speedoran/src/screens/game_detail/game_detail.dart';
import 'package:speedoran/src/screens/user_detail/user_styles.dart';

class UserPersonalBests extends StatelessWidget
{
    final List<PersonalBestModel> personalBests;
    UserPersonalBests(this.personalBests);

    @override
    Widget build(BuildContext context){
      if(this.personalBests == null){
        return  getSkellyStrut(context);
      }

      return Padding(
        padding: EdgeInsets.only(left:20, top:20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: personalBests.isEmpty ? 
            <Widget>[Text("No runs found...", style: TextStyle(color: Colors.white))] : 
            personalBests.map((e) => 
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                    PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 500),
                      transitionsBuilder: (context,animation,animationTime,child){
                        animation = CurvedAnimation(parent: animation, curve: Curves.easeIn);              
                        return FadeTransition(opacity: animation, child: child);
                      },
                      pageBuilder: (contex, animation, animationTime){
                        return GameDetail(new GameViewModel(id: e.game.id));
                      }
                  ));
                },
                child: Padding(padding: EdgeInsets.only(bottom: 10),
                child: Row(
                children:[
                  ClipRRect(borderRadius:  BorderRadius.circular(10.0),
                  child:Image.network(
                    e.game?.assets?.coverLarge?.uri,
                    width: MediaQuery.of(context).size.width * 0.20,
                    fit: BoxFit.fitWidth,
                    loadingBuilder: (context, child, loadingProgress) {
                      return loadingProgress == null
                        ? child
                        : SkeletonAnimation(  
                            child: Container(  
                              height: 50,  
                              width: MediaQuery.of(context).size.width * 0.2,  
                              decoration: BoxDecoration(  
                              borderRadius: BorderRadius.circular(3.0),  
                              color: Colors.grey)  
                        ));
                  })),
                  Padding(
                    padding: EdgeInsets.only(
                        left:MediaQuery.of(context).size.width*0.02,
                        right: MediaQuery.of(context).size.width*0.02),
                    child: 
                    Column(children: [
                      Trophies.formatTrophy(e.place),
                      Text(Formatters.formatPlacing(e.place), style: PlacingTextStyle),
                  ])),
                  Container(
                    width: MediaQuery.of(context).size.width*0.58,
                    child: 
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      Text(e.game.names.international, style: GameNameTextStyle),
                      Text(Formatters.formatTime(e.run?.times?.primary), style: TimeTextStyle),
                      Text('Category: ${e.game.categories?.first?.name}', style: CategoryTextStyle),
                  ]))
              ]))))
      .toList()));
    }

    Widget getSkellyStrut(BuildContext context){
        return 
        Padding(
          padding: EdgeInsets.only(left: 5, top:10),
          child: Column(
            children: [
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child:  SkeletonAnimation(  
                  child: Container(  
                  height: 60,  
                  width: MediaQuery.of(context).size.width * 0.9,  
                  decoration: BoxDecoration(  
                    borderRadius: BorderRadius.circular(3.0),  
                    color: Colors.grey)  
                  ))),
                  Padding(
                  padding: EdgeInsets.only(top: 10),
                  child:  SkeletonAnimation(  
                  child: Container(  
                  height: 60,  
                  width: MediaQuery.of(context).size.width * 0.9,  
                  decoration: BoxDecoration(  
                    borderRadius: BorderRadius.circular(3.0),  
                    color: Colors.grey)  
                  ))),
                  Padding(
                  padding: EdgeInsets.only(top: 10),
                  child:  SkeletonAnimation(  
                  child: Container(  
                  height: 60,  
                  width: MediaQuery.of(context).size.width * 0.9,  
                  decoration: BoxDecoration(  
                    borderRadius: BorderRadius.circular(3.0),  
                    color: Colors.grey)  
                  ))),
                  Padding(
                  padding: EdgeInsets.only(top: 10),
                  child:  SkeletonAnimation(  
                  child: Container(  
                  height: 60,  
                  width: MediaQuery.of(context).size.width * 0.9,  
                  decoration: BoxDecoration(  
                    borderRadius: BorderRadius.circular(3.0),  
                    color: Colors.grey)  
                  ))),
                  Padding(
                  padding: EdgeInsets.only(top: 10),
                  child:  SkeletonAnimation(  
                  child: Container(  
                  height: 60,  
                  width: MediaQuery.of(context).size.width * 0.9,  
                  decoration: BoxDecoration(  
                    borderRadius: BorderRadius.circular(3.0),  
                    color: Colors.grey)  
                  )))
              ]));
    }
}