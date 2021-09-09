import 'image_banner.dart';
import 'package:speedoran/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:speedoran/src/viewmodels/gameviewmodel.dart';

class GameFullInfo extends StatelessWidget{
  GameFullInfo(this._game);
  final GameViewModel _game;

  void openUrl(String uri) {
    canLaunch(uri).then((value) => launch(uri));
  }
  
  @override
  Widget build(BuildContext context){
      return 
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageBanner(this._game.cover),
          Container(
            padding: EdgeInsets.only(left:10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(child: Container(
                        width: 220,
                        padding:EdgeInsets.fromLTRB(5.0, 0, 0, 5.0),
                        child: Text(this._game.name,style: GameTitleTextDetail,overflow: TextOverflow.clip,maxLines: 3,))),
                Flexible(child: Container(
                        padding:EdgeInsets.fromLTRB(5.0, 0, 0, 5.0),
                        width: 220,
                        child: Text("Released in ${this._game.released.toString().trim()}",style: GameSubTitleTextDetail))),
                Flexible(child: Container(
                        padding:EdgeInsets.fromLTRB(5.0, 0, 0, 5.0),
                        width: 220,
                        child: Text("Platforms: ${this._game.platforms.isEmpty ? "Not available" : this._game.platforms.map((e) => e).join(", ")}",style: GameSubTitleTextDetail,overflow: TextOverflow.clip,maxLines: 5))),
                Flexible(child: Container(
                        padding:EdgeInsets.fromLTRB(5.0, 0, 0, 5.0),
                        width: 220,
                        child: Text("Developers: ${this._game.developers.isEmpty ? "Not available" : this._game.developers.map((e) => e).join(", ")}",style: GameSubTitleTextDetail,overflow: TextOverflow.clip,maxLines: 5))),
                Flexible(child: Container(
                        padding:EdgeInsets.fromLTRB(5.0, 0, 0, 5.0),
                        width: 220,
                        child: InkWell(child: Text("See more at speedrun.com/${this._game.abbrv}", style: WebLinkText), onTap: () => openUrl(this._game.weblink))
                ))]
              ))]);
  }
}