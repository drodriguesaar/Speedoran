import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:speedoran/src/viewmodels/gameviewmodel.dart';
import 'package:speedoran/src/screens/games_list/game_title.dart';
import 'package:speedoran/src/screens/game_detail/game_detail.dart';
import 'package:speedoran/src/screens/games_list/game_thumbnail.dart';
import 'package:speedoran/src/screens/gameseries_detail/gameseries_detail.dart';

class GameListItem extends StatelessWidget {
  final GameViewModel _game;
  final bool isSerie;
  final Color _background = Colors.black.withOpacity(0.9);
  GameListItem(this._game, { this.isSerie = false });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        key: Key(this._game.id),
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
                return this.isSerie ? GameSeriesDetail(this._game) : GameDetail(this._game);
              }
          ));
        },
        onLongPress: () {},
        child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 3.0,
                      spreadRadius: 2.0),
                ]),
            child: GridTile(
                footer: Container(
                    child: GameTitle(this._game.name),
                    alignment: Alignment.bottomCenter,
                    padding: EdgeInsets.all(6.5),
                    decoration: BoxDecoration(
                        color: this._background,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0)))),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GameThumbnail(this._game.cover),
                    ]))));
  }
}
