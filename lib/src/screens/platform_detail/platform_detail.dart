import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:speedoran/src/models/gamemodel.dart';
import 'package:speedoran/src/models/platformmodel.dart';
import 'package:speedoran/src/service/platforms_service.dart';
import 'package:speedoran/src/screens/shared/speedrun_scaffold.dart';
import 'package:speedoran/src/screens/platform_detail/platform_game.dart';
import 'package:speedoran/src/screens/platforms_list/platformstyles.dart';
import 'package:speedoran/src/screens/platform_detail/platform_header.dart';
import 'package:speedoran/src/screens/platform_detail/platform_gamesskelly.dart';

class PlatformDetail extends StatefulWidget {
  PlatformDetail(this.platformModel);   
  final PlatformModel platformModel;
  State<StatefulWidget> createState () => new PlatformDetailState(platformModel);  
}

class PlatformDetailState extends State<PlatformDetail>{
  PlatformDetailState(this.platform);
  
  final PlatformModel platform;

  List<GameModel> platformGames = new List<GameModel>();
  bool isLoadingGames = true;

  void getPlatformGames(){
    PlatformsService.fetchPlatformGames(this.platform.id)
      .then((gamesList) {
        if(mounted){
          this.setState(() {
            this.isLoadingGames = false;
            this.platformGames = gamesList;
          });
        }
      });
  }

  @protected
  @mustCallSuper
  @override
  void initState() {
    super.initState();
    getPlatformGames();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    var platformGamesSkelly = PlatformGamesSkelly();
    var platformGamesResult = this.platformGames?.map((e) =>PlatformGame(e))?.toList();

    return SpeedrunScaffold(
      title:"Platform", 
      body: [Expanded(
        child: ListView(children: [
          PlatformHeader(platform.name,platform.released),
          Padding(
            padding: EdgeInsets.only(top: 10,bottom: 10),
            child: Text("Games",style: PlatformLabelLargeStyle,textAlign: TextAlign.center)
          )
          ]..addAll(this.isLoadingGames ? [platformGamesSkelly] : platformGamesResult)))
      ]
    );
  }
}