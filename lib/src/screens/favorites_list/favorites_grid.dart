import 'package:flutter/cupertino.dart';
import 'package:speedoran/src/models/favgamemodel.dart';
import 'package:speedoran/src/screens/favorites_list/nofavorites_list.dart';
import 'package:speedoran/src/screens/games_list/game_listitem.dart';
import 'package:speedoran/src/viewmodels/gameviewmodel.dart';

class FavoritesGrid extends StatelessWidget{

  final List<FavGameModel> favGames;
  
  FavoritesGrid(this.favGames);

  @override
  Widget build(BuildContext context){
    if(this.favGames.isEmpty){
      return NoFavoritesList();
    } 
    return GridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 20.0,
      crossAxisSpacing: 10.0,
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 20.0),
      children: favGames.map((e) => new GameListItem(
        new GameViewModel(
          id: e.favGameID,
          name: e.title,
          cover: e.urlGameCover
        )
      )).toList()
    );
  }
}